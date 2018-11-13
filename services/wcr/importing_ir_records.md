# Importing IR records

> This is now defunct. IR (Integrated Regulations - the name of the previous system) registrations was the name given to registrations created prior to the introduction of the Waste Carriers digital service. To support decommissioning of the IR system an import function was written to import those that were still valid into this service. The last IR registration expired in September 2018 and the registrant would have been expected to create a new registration in the digital service to replace it.

As of February 2016, the Waste Carrier Services component includes code to import Registrations from a CSV file.  This facilitates migration of Waste Carrier data from IR, to allow IR decommissioning.  This is a one-off activity.

In brief, the code will read each line of the CSV file and parse the data into a new Registration, or append the data in the current row to the Registration from a previous row.  Checks are performed on the raw data, and on the resulting Registration object, to check for invalid values.  The majority of checks will result in an 'Action' (something we *should* do) or 'Recommendation' (something less important, but still a good idea).  However, some errors are so important that the importer will refuse to accept the data.  When this happens, **no data from the CSV file will be written to the database**.  This ensures we don't import only a subset of data, and then have to puzzle over which records from the CSV file we need to re-try importing.

## Prep

It will be useful to check the number of Registrations in the MongoDb database before and after running the IR importer:

```bash
mongo waste-carriers -u <username> -p <password>
db.registrations.count()
```

## Take a MongoDb backup

The easiest way to backup the MongoDb database is to copy the underlying files. This should only be done when the `mongod` process is not running.
<https://docs.mongodb.org/manual/core/backups/#backup-with-file-copies>

## Running the importer

The importer can only be run when the services is not already running as a REST server.

Start by performing a dry run, saving the output to a log file:

```bash
java -jar waste-exemplar-services.jar irimporter configuration.yml -s [source_file.csv] --dryrun > [source_file_log.txt]
```

where `waste-exemplar-services.jar`, `configuration.yml`, `source_file.csv` and `source_file_log.txt` should all be set to the appropriate file-paths.

In dry run mode the database will not be modified. This lets us check for any lines in the CSV file which won't import successfully.

## Cleaning the CSV files prior to import

Suggested approach:

Errors which prevent the data from being imported start with the word 'Failed': `grep 'Failed' [source_file_log.txt]`

Which might produce output such as the following:

```bash
Failed to import data from row 12345: value in SURNAME is too short.
Failed to import registration CB/AB1234CD/R003: no Key Person identified.
Failed to import registration CB/EF5678GH/A001: no Key Person identified.
```

We want to import the acceptable records only, so lets remove the invalid data from the file. Some invalid data is identified by line number, other invalid data is identified by Registration Number. We can remove both using `sed`:

```bash
sed '12345; /AB1234CD/d; /EF5678GH/d' [source_file.csv] > [source_file_filtered.csv]
```

You should then be able to import the "good" records from `source_file_filtered.csv` without error. Test this by doing another dry run first; this time there should be no matches for "Failed" in the output.

To see the deleted lines: `diff [source_file.csv] [source_file_filtered.csv]`

## Performing the import

To import the data from CSV file and write to the MongoDb database, run the command above *without* the `--dryrun` flag:

```bash
java -jar waste-exemplar-services.jar irimporter configuration.yml -s [source_file_filtered.csv] > [source_file_filtered_log.txt]
```

You can then check the new number of registrations in the database using the MongoDb command above.
