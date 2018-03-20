# Report landfill data

Also commonly known as the **Data Returns** service, though the team behind it are focused on building a platform rather than a single service, hence the name.

To quote the [guidance page](https://www.gov.uk/guidance/report-landfill-data-england-only)

> Your landfill permit or licence will list the data you must report and when you have to send it.
>
> Use this service to report periodic emissions and monitoring data to the Environment Agency.

## High level overview

The service is not a typical transaction based one, with users entering information via a series of ordered steps.

Instead it is designed to allow them to upload data in a CSV, and have the service first validate it, then forward it automatically to a system called EMMA.

The service is made up of an external facing Node.js web app, and a RESTful web service powered by Java [Spring Boot](https://projects.spring.io/spring-boot/). The web service handles the validation of uploaded CSV files.

## Repositories

Currently the service is made up of the following repositories

- [Data returns front end](https://github.com/DEFRA/data-returns-frontend) - external facing Node.js web app
- [Data returns data exchange](https://github.com/DEFRA/data-returns-data-exchange) - RESTful web service that handles validation of submitted files

The QA and Test engineer manages the following

- [Data returns acceptance tests](https://github.com/DEFRA/data-returns-acceptance-tests) - automated acceptance tests for the service
