# Error Notifications

Applications should report errors in an [Airbrake](https://airbrake.io/) compliant format to an internally maintained instance of [Errbit](https://github.com/errbit/errbit) (details available from team leads).

Reporting them in this way enables

- **Easier access for teams**; no need to request permission to access production logs
- **More details**; Airbrake compliant errors often will include the full stack trace along with meaningful data about the environment at the time
- **Less noise**; you get just the error rather than trying to extract it from other output in the log, and Errbit will automatically group errors
- **Better integrations**; we can integrate Errbit with the tools we use like [Slack](https://slack.com/)

Below are examples of how to integrate Airbrake into the your app, based on technology.

## [Node](https://nodejs.org/en/)

### Standard applications

[Node-airbrake](https://github.com/airbrake/node-airbrake) should be used for standard (non-Hapi) Node applications.

For implementations details see  [Node-airbrake](https://github.com/airbrake/node-airbrake).

### Hapi based applications

If your application is using [Hapi](http://hapijs.com/) you should use [Node-hapi-airbrake](https://github.com/EnvironmentAgency/node-hapi-airbrake)  instead.

Node-hapi-airbrake is a plug-in wrapper for Node-airbrake, so that it can be loaded as a native plug-in. It also exposes some extra configuration to enable users to connect to hosted Errbit instances, rather than the default Airbrake host.

As well as adding a listener to the Hapi server for `request-error`, it also sets a server method, with a configurable name, that enables the application to manually notify Errbit, by calling

```javascript
server.methods.notify(new Error(), (err, url) {
  ...
})
```

For implementation details see [Node-hapi-airbrake](https://github.com/EnvironmentAgency/node-hapi-airbrake).
