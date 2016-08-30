# Configuration

When setting up configurables for an application we need to take into account several things.

- Private and sensitive variables
  - These can be stored in a private repo in GitLab
- Public variables
  - These can be stored in the application's config
- Validation
  - A Schema needs to be set that validates the config object on application start up
- Maintainability
- Source control

## NodeJS guide

Within `/config` create a `server.json` file with your configuration object, but have an appropriately named object that deals with sensitive variables taken from environment variables.

```json
{
  "server": {
    "host": "0.0.0.0",
    "port": 3000,
    "labels": "web"
  },
  "views": {
    "isCached": false
  },
  "httpTimeoutMs": 10000,
  "envVars": {
    "os_names_key": "",
    "os_names_url": "",
    "os_maps_url": ""
  }
}
```

Setup a validation object as `schema.js`, `Joi` is recommended for `HapiJS`
appplications.

```javascript
var Joi = require('joi')

var serverSchema = Joi.object().required().keys({
  host: Joi.string().hostname(),
  port: Joi.number().required(),
  labels: Joi.string()
})

var envVarsSchema = Joi.object().required().keys({
  os_names_key: Joi.string().required(),
  os_names_url: Joi.string().required(),
  os_maps_url: Joi.string().required()
})

module.exports = {
  server: serverSchema,
  logging: Joi.object(),
  views: Joi.object().required().keys({
    isCached: Joi.boolean().required()
  }),
  httpTimeoutMs: Joi.number().required().min(0).max(30000),
  envVars: envVarsSchema
}
```

Now add an `index.js` file to the `/config` directory.  The job of this file is
that when we `require(./config)` it will return a populated configuration
object. Thus the script must:

- `require('server.json')`
- Populate the sensitive config from environment variables
  - If `server.json` has a value it will override the environment variable, so that application user doesn't have to set env vars and can populate the json object themselves.
- Pass the config object through the schema Validation
  - If it fails it will throw an error and stop the application starting, to ensure that the config is correctly setup, this is to help identify build breaks where configuration is the offender.
- Then return the full config object through `module.exports`

Like so:

```javascript
var Joi = require('joi')
var schema = require('./schema')
var config = require('./server.json')

if (config.envVars) {
  var envVars = config.envVars
  for (var key in envVars) {
    // if server.json has a value then override the env var
    envVars[key] = envVars[key] || process.env[key.toUpperCase()]
  }
}

Joi.validate(config, schema, function (err, value) {
  if (err) {
    throw new Error('The server config is invalid. ' + err.message)
  }
  // Update config with validated object
  config = value
})

module.exports = config
```

The list of environment variables should then be stored in a private repository, that a developer can access for their local build and Jenkins (or a n other build tool) can access to perform CI builds.
