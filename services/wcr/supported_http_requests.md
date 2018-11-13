# Supported http requests

There are a number of endpoints the Java services support, but they don't follow a particular pattern. As such this is an ongoing record of what those endpoints are, with examples of how to test them using [curl](https://curl.haxx.se/)

It covers those available via the standard port (8003), and the Admin (8004). Typically endpoints on the Admin port are tasks and [background jobs](https://github.com/DEFRA/waste-carriers-service/wiki/Background-jobs) and not expected to be called from client apps.

## Standard port (8003)

### GET /registrations.json/{registrationNumber}

Get the services to search MongoDb directly for a registration with the matching registration number. If found will return the registration as JSON.

```bash
curl 'http://localhost:8003/registrations.json/CBDU39852'
```

It was built to support the front end being able to validate that a registration is eligible for renewal.

### GET /registrations.json/original/{registrationNumber}

Get the services to search MongoDb directly for a registration with the matching IR number (held in the `originalRegistrationNumber` field). If found will return the registration as JSON.

```bash
curl 'http://localhost:8003/registrations.json/original/CB%2FRN5419MF%2FR002'
```

Note the need to escape forward slashes in the query. The actual number would be **CB/RN5419MF/R002**

It was built to support the front end being able to validate that an IR registration is eligible for renewal.

### GET /match/company

Query the services for a matching company entity. Search values are passed via query params and it expects either a name, number or both

```bash
curl 'http://localhost:8003/match/company?name=Test%20Waste%20Services'
curl 'http://localhost:8003/match/company?number=00009876'
curl 'http://localhost:8003/match/company?name=Recycle-pro&number=00009876'
```

### GET /match/person

Query the services for a matching person entity. Search values are passed via query params and it expects both a first name and last name. It can also include a date of birth.

```bash
curl 'http://localhost:8003/match/person?firstname=Fred&lastname=Blogs'
curl 'http://localhost:8003/match/person?firstname=Fred&lastname=Blogs&dateofbirth=01-01-1981'
```

## Admin port (8004)

### POST /tasks/entity-populator

Will rebuild the Entities collection in the *entity-matching* database from a CSV file.

```bash
curl -X POST http://localhost:8004/tasks/entity-populator
```

It also has the ability to read data from the POST body, and rebuild the collection using it. This was specifically added to support acceptance testing.

### POST /tasks/start-registrationStatusJob

When called will query MongoDb for records that have expired and then update the status of each one. This is also a [background job](https://github.com/DEFRA/waste-carriers-service/wiki/Background-jobs:-expired-registrations)

```bash
curl -X POST http://localhost:8004/tasks/start-registrationStatusJob
```

### POST /tasks/start-exportJob

Will generate both the BOXI export files (which is essentially all registrations broken down into a series of CSV files which are imported into a BOXI universe) and the Electronic Public Register file (a single file used to refresh the register each day). This is also a [background job](https://github.com/DEFRA/waste-carriers-service/wiki/Background-jobs)

```bash
curl -X POST http://localhost:8004/tasks/start-exportJob
```

### POST /tasks/ir-repopulate

Repopulates the IR Renewals collection from a CSV file. This is a task that in production will only have been run once, but is available as a command so we can recreate and test the service locally.

```bash
curl -X POST http://localhost:8004/tasks/ir-repopulate
```
