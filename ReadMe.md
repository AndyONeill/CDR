#Technology Chosen

I've gone with SQL server and asp.net because these are what I have the most experience in.

#Data Import

I use bulk insert because this is very fast but easier to work with than BCP when things go wrong.
There are inevitably issues importing files and it can take a surprising amount of time just to get some data into your database.

I chose to use a staging table because it avoids the initial complications you get with data import. I can "just" use an import wizard to create the initial table and then iterate from there.

Once live a staging table decouples import format from internal structure.

There are often validation and conversion complications.
EG 
Date and times should be stored as UTC.
I don't know if that data is already converted or not.
Maybe it is, maybe it isn't.

The import is just sql at the moment.

I'd probably want to turn that into ssis and a batch job but that needs more analysis to check how the business needs this to work.

This'll work whilst we arrange those meetings.

#Table Design

I have an id column because you routinely find you need one if you manipulate data. If I add one on from the start then everything is built ready to deal with an id. Add it on later and any import would likely need revisiting.

#API Design

The spec is very loose and this task is not ready for work.

Not sure how it got to this stage but we need to arrange a three amigos session with product and find out what they need before this goes any further.

We can iterate from there.

#ORM

I chose dapper because it's lightweight, simple and closer to the metal than say entity framework.

#Data Manipulation

The spec mentions large files daily which sounds like the real thing will have lots of data.
BI on large datasets pretty much has to be on the server.  Doing averaging and summing on a web server would rely on selecting low numbers or rows out that dataset. We do not have any clear definition of requirements so we cannot rely on that.

A database orientated app will do any substantial logic in sql on the database.

That means any automated testing has to be higher granularity than you would use for tdd and will rely on a test database.
I therefore wrote and refined the sql in ssms before adding to the solution.

Next step is to build a test database and I can switch out connection string to ensure the repository returns correct data. 



