# Background jobs

From March 2016 the [Waste Carriers service](https://github.com/DEFRA/waste-carriers-service) contains two background jobs which are normally run on a schedule, e.g. nightly. The schedule is set in the service's `configuration.yml` file. The first job exports data from the service to CSV files for the Electronic Public Register (EPR), and for a data feed for the waste carriers BOXI universe. The second job marks registrations as "expired".

Support for background jobs is implemented using [Quartz](http://www.quartz-scheduler.org/)

## Expired registrations

The expired registrations background job is used to identify and mark as EXPIRED those upper tier registrations which have not been renewed.

In the service it is called `RegistrationStatusJob`.

### Query

It finds all registrations that have an `expires_on` date and time which is less than (`$lt`) 00:00 on the day after execution. So for example if run on 25 March 2018, it searches for all **ACTIVE** upper tier registrations with an `expires_on` less than 2018-03-26 00:00:00.

### Update

All registrations found will have their `metaData.status` set to **EXPIRED** and their `metaData.lastModified` set to the current date and time.

### Process

This is done as a single update call to MongoDb. The query is initially put together, then details of what is to be updated are then passed to the call `WriteResult<Registration, String> result = registrations.updateMulti(query, update);`

## Export

The export background job has two purposes

- generate the file which is then used as the basis for the electronic public register (EPR)
- generate a reporting snapshot which then used to populate a BOXI universe for reporting

It iterates through every registration in the system and passes them to two methods

- `exportRegistrationForEpr(eprCsvFile, reg)`
- `exportRegistrationForReporting(reg)`

### Electronic Public Register (EPR) export

The [EPR](https://environment.data.gov.uk/public-register/view/search-waste-carriers-brokers) is an online search tool that users can use to find an 'ACTIVE' waste carrier, to validate they are registered.

It was maintained by a company called [Epimorphics](https://www.epimorphics.com/) but this has recently changed (Oct 2018). The EPR export produces a CSV of all **ACTIVE** registrations (they must also have a non-empty company name).

The name of the file is configured by an environment variable that is used to set the value in the `configuration.yml`.

### Reporting snapshot export

The reporting snapshot is used to export everything in the service. The only check is to ensure a registration has a `metaData` object else it will record an error and skip the registration.

The export is made up of several files

- registrations.csv
- addresses.csv
- key_people.csv
- sign_offs.csv
- orders.csv
- order_items.csv
- payments.csv

The end result is that the data is loaded into a BOXI reporting universe to allow users to run reports.

### Transferring the data

Both exports are transferred to an AWS S3 bucket from which they are then downloaded by the relevant parties.

Creating the zip files and then uploading to S3 is managed by a bash script, written by the web-ops team (we don't currently have sight of it).

## Manually triggering background jobs

Even when the jobs are run on a schedule, they can also be started by a manual trigger. This might be especially useful after any database changes or maintenance tasks, for example.

To manually start the "registration status" job

```bash
curl -X POST http://localhost:8004/tasks/start-registrationStatusJob
```

To manually start the "export" job

```bash
curl -X POST http://localhost:8004/tasks/start-exportJob
```

To manually start the "IR re-populate" job

```bash
curl -X POST http://localhost:8004/tasks/ir-repopulate
```

To manually start the "location populator" job

```bash
curl -X POST http://localhost:8004/tasks/location
```

## Checking background job status

You can get some information about the status of the background jobs

``` bash
curl -X POST http://localhost:8004/tasks/get-jobMetrics
```

## Support for load-balanced environments

In a load-balanced environment where the services run on more than one server, you can use different `configuration.yml` files to ensure the background jobs are spread across the servers. In our case however we have it configured that the jobs only run on run instance, by manually editing the `configuration.yml` file on the second instance to specify a date far in the future.

```yml
exportJob:
  cronExpression: ${WCRS_EXPORT_JOB_CRON_SCHEDULE:-0 0 21 1 DEC ? 2025}

registrationStatusJob:
  cronExpression: ${WCRS_STATUS_JOB_CRON_SCHEDULE:-0 0 20 1 DEC ? 2025}
```
