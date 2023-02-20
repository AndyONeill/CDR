using CDR.Data.models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;

namespace CDR.Data
{
    public class CallRepository
    {
        private string _connectionString;
        public async Task <IEnumerable<CallerSpend>> GetCallerSpends(string callerId, DateTime from, DateTime to)
        {
            using var conn = new SqlConnection(_connectionString);
            var qry = await conn.QueryAsync<CallerSpend>(
                @"select  call_date as Day
                , sum(1) as NumberCalls
                , AVG(cost) as AverageCost
                , sum(cost) as TotalCost
                from dbo.Calls
                where    
                caller_id = @callerId and
                call_date >= @from and call_date <= @to
                group by call_date",
                        new
                        {
                            callerId,
                            from,
                            to
                        },
            commandType: System.Data.CommandType.Text);
            return qry.ToList();
        }

        public CallRepository(string connectionString)
        {
            _connectionString = connectionString;
        }
    }
}
