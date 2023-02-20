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

        public CallerController(ILogger<CallerController> logger)
        {
            _logger = logger;
        }

        [HttpGet("SpentByDay")]
        public IEnumerable<CallerSpend> Get(DateTime from, DateTime To)
        {
            var result = new List<CallerSpend>();
            result.Add(new CallerSpend{ Day = DateTime.Now, AverageCost = 32.123, NumberCalls=3, TotalCost = 7654.456 });
            return result;
        }
    }
}
