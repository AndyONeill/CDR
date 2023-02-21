using CDR.Data.models;
using FluentAssertions;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.Extensions.Configuration;
using System.Diagnostics;
using System.Net;
using System.Net.Http.Json;

namespace CDR.Integration.Tests
{
    public class CallerControllerTests : IClassFixture<WebApplicationFactory<Program>>
    {
        private readonly WebApplicationFactory<Program> _factory;
        private readonly string spentByDayUrl = "/api/Caller/SpentByDay";
        public CallerControllerTests(WebApplicationFactory<Program> factory)
        {
            var projectDir = Directory.GetCurrentDirectory();
            var configPath = Path.Combine(projectDir, "appsettings.json");

            _factory = factory.WithWebHostBuilder(builder =>
            {
                builder.ConfigureAppConfiguration((context, conf) =>
                {
                    // substitute test database for real one using test appsettings for connection string
                    conf.AddJsonFile(configPath);
                });
            });
        }

        [Fact]
        public async Task GET_Caller_SpentByDay_Call_Success()
        {
            // Arrange
            var callerid = "441215598896";
            var from = new DateTime(2016, 1, 1);
            var to = new DateTime(2017, 1, 1);
            var exampleCallUrl = spentByDayUrl + $"?callerId={callerid}&from={from}&to={to}";

            // Act
            using var client = _factory.CreateClient();
            var response = await client.GetAsync(exampleCallUrl);

            // Assert
            response.EnsureSuccessStatusCode();
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }

        [Fact]
        public async Task GET_Caller_SpentByDay_Specific()
        {
            // Arrange
            var callerid = "441215598896";
            var from = new DateTime(2016, 1, 1);
            var to = new DateTime(2017, 1, 1);
            var exampleCallUrl = spentByDayUrl + $"?callerId={callerid}&from={from}&to={to}";
            var expected = new List<CallerSpend>
            {
                new CallerSpend{ Day = new DateTime(2016, 8,16), AverageCost=1.234, NumberCalls=1, TotalCost=1.234 }
            };

            // Act
            using var client = _factory.CreateClient();
            var response = await client.GetAsync(exampleCallUrl);
            var result = await response.Content.ReadFromJsonAsync<List<CallerSpend>>();

            // Assert
            expected.Should().BeEquivalentTo(result);
        }

        [Fact]
        public async Task GET_Caller_SpentByDay_Multiple_Rows()
        {
            // Arrange
            var callerid = "442036401149";
            var from = new DateTime(2016, 1, 1);
            var to = new DateTime(2017, 1, 1);
            var exampleCallUrl = spentByDayUrl + $"?callerId={callerid}&from={from}&to={to}";
            var expected = new List<CallerSpend>
            {
                new CallerSpend{ Day = new DateTime(2016, 8,16), AverageCost=0.354666, NumberCalls=3, TotalCost=1.064 },
                new CallerSpend{ Day = new DateTime(2016, 8,17), AverageCost=0, NumberCalls=1, TotalCost=0 }
            };

            // Act
            using var client = _factory.CreateClient();
            var response = await client.GetAsync(exampleCallUrl);
            var result = await response.Content.ReadFromJsonAsync<List<CallerSpend>>();

            // Assert
            expected.Should().BeEquivalentTo(result);
        }
        [Fact]
        public async Task GET_Caller_SpentByDay_Day_Comparison()
        {
            // Arrange
            var callerid = "442036401149";
            var from = "08%2F16%2F2016";
            var to = "08%2F16%2F2016";
            var exampleCallUrl = spentByDayUrl + $"?callerId={callerid}&from={from}&to={to}";
            var expected = new List<CallerSpend>
            {
                new CallerSpend{ Day = new DateTime(2016, 8,16), AverageCost=0.354666, NumberCalls=3, TotalCost=1.064 }
            };

            // Act
            using var client = _factory.CreateClient();
            var response = await client.GetAsync(exampleCallUrl);
            var result = await response.Content.ReadFromJsonAsync<List<CallerSpend>>();

            // Assert
            expected.Should().BeEquivalentTo(result);
        }

        [Fact]
        public async Task GET_Caller_SpentByDay_No_Rows()
        {
            // Arrange
            var callerid = "442036401149";
            var from = new DateTime(2017, 1, 1);
            var to = new DateTime(2017, 1, 1);
            var exampleCallUrl = spentByDayUrl + $"?callerId={callerid}&from={from}&to={to}";
            var expected = new List<CallerSpend>();
 
            // Act
            using var client = _factory.CreateClient();
            var response = await client.GetAsync(exampleCallUrl);
            var result = await response.Content.ReadFromJsonAsync<List<CallerSpend>>();

            // Assert
            expected.Should().BeEquivalentTo(result);
        }
    }
}
