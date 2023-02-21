# Technology Chosen

I've gone with SQL server and asp.net because these are what I have the most experience in.

## Data Import

This is done using the import.sql script which you can run from ssms.

We can refine this process once things are firmed up and perhaps build an SSIS package and run that from a batch job.

I use bulk insert because it's very fast but easier to work with than BCP when things go wrong.
There are inevitably issues importing files and it can take a surprising amount of time just to get some data into your database.

I chose to use a staging table cdr_import to minimise the initial complications you get with data import. 
I can "just" use an import wizard to create the initial table and then iterate from there.

Once live a staging table is handy because it decouples import format from internal structure.
When your import job goes mysteriously wrong, you have the data there to look at.

There are often validation and conversion complications.
EG 
Date and times should be stored as UTC.
I don't know if that data is already converted or not.

This'll work whilst we arrange those meetings.

## Table Design

I have an id column because you routinely find you need one if you manipulate data. 
If I add one on from the start then everything is built ready to deal with an id. 
Add it on later and any import would likely need revisiting.

## API Design

The spec is very loose and if this was a real world requirement then I would say this task is not ready for work.

We should arrange a three amigos session with product and find out what they need before this goes any further.

We can iterate from there.

I've done one example endpoint but I don't want to just guess what other requirements there might be.
I will guess wrong.

## ORM

I chose dapper because it's lightweight, simple and closer to the metal than say entity framework.

## Data Manipulation

The spec mentions large files daily which sounds like the real thing will have lots of data.
BI on large datasets pretty much has to rely on SQL run on the server.
Averaging and summing on a web server would rely on selecting low numbers or rows out that dataset. 
We do not have any clear definition of requirements so I have assumed large numbers of rows might be processed.

A database orientated app will do any substantial logic in sql on the database.

That means any automated testing has to be higher granularity than you would use for tdd and will rely on a test database.
I therefore wrote and refined the sql in ssms before adding to the solution.


## Testing

I've built integration tests as a critical part of this ( and any BI ) is the sql.

In order to have known fixed data I built a test database and added a few rows.

This can later be extended as requirements are refined and we add more.

The test project is CDR.Integration.Tests

That contains it's own appsetttings.json
When you run the tests, this will be copied across over the appsettings.json in the CDR project.
The connection string in this json file will replace that in CDR and it'll use the CDRTest database


## Swagger

I've implemented basic swagger ui so I/you can try the app manually.
Might be handy in demonstrating this to product


![Swagger](https://i.imgur.com/383as27.png)


## Set up

The app currently just works with a database on my development machine.

That would of course need to change as we'd want this on a server.

Until then, the connection string relies on integrated security.

You will need two databases.

Since the files for these are dependent on knowing disk drive and folder location, I've not scripted database creation.
You can right click database and create new in ssms.

There are scripts to create tables for these in the Database folder of the repo, although you may need to edit them to change file locations.

The first is called CDR.
That will have two tables - Calls and the staging table ( as described above ) cdr_import.

A second database CDRTest is necessary for the integration tests.
The script for that creates data in the CDRTest.dbo.Calls table.