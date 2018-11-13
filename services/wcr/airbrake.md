# Airbrake

In June 2016, support for [Airbrake-based](https://github.com/airbrake/airbrake-ruby) exception-logging was added to [Waste carriers frontend](https://github.com/DEFRA/waste-carriers-frontend) and the [Waste carriers service](https://github.com/EnvironmentAgency/waste-carriers-service).

When we introduced [Waste carriers front office](https://github.com/DEFRA/waste-carriers-front-office) and [Waste carriers back office](https://github.com/DEFRA/waste-carriers-back-office) we also added Airbrake support to them.

## Errbit

Exceptions caught in the apps are logged to a server an instance of [Errbit](https://github.com/errbit/errbit) we have running

- None production environments <https://dst-errbit.herokuapp.com/>
- Production environments <https://errbit.aws-int.defra.cloud/>

## Testing

To test Airbrake logging for the front end run `bundle exec rake airbrake:test`

To test Airbrake logging for the Java services, ensure the services is running and then call

```bash
curl -X POST http://localhost:9091/tasks/generateTestException
```
