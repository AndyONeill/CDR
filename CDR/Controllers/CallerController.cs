using CDR.Data;
using CDR.Data.models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Build.Experimental.ProjectCache;

namespace CDR.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CallerController : ControllerBase
    {

        private readonly ILogger<CallerController> _logger;
        private readonly IConfiguration _configuration;

        public CallerController(ILogger<CallerController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        [HttpGet("SpentByDay")]
        public async Task<IEnumerable<CallerSpend>> Get(string callerId, DateTime from, DateTime to)
        {
            CallRepository repo = new CallRepository(_configuration.GetConnectionString("CDR")??string.Empty);
            var result = await repo.GetCallerSpends(callerId, from, to.AddDays(1));
            return result;
        }
    }
}
