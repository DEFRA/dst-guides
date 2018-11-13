# Migrations

> The tasks talked covered here were one off tasks needed to update the registration documents at specific stages in the life of the service, as changes were made. They have been run and no longer applied, so both this guide and the tasks just need to be deleted.

Because the service does not talk to the database directly using something like ActiveRecord, any migrations have to be written and added to the project manually.

We use [rake](https://github.com/ruby/rake) to write and execute any data migrations. These should be added to the namespace ```data_migration``` and you can find the ones below in the [data_migration.rake](https://github.com/EnvironmentAgency/waste-exemplar-frontend/blob/master/lib/tasks/data_migration.rake) task

## Phase 1 registrations

Phase 2 involved adding the upper tier process to the service. It covered large scale changes to the functionality and required us to update the existing data in order to work with them. Therefore any records created prior to [v2.0-beta](https://github.com/EnvironmentAgency/waste-exemplar-frontend/releases/tag/v2.0-beta) would need to by migrated.

```bash
rake data_migration:lower_tier
```

In this case the migration of phase 1 registrations involved nothing more than adding a "tier" field to each record and setting its value to "LOWER" (if the field did not already exist).

## Multiple addresses

Release [to be confirmed](https://github.com/EnvironmentAgency/waste-exemplar-frontend) included changes to the registration model so that address details are now held in a model called [address](https://github.com/EnvironmentAgency/waste-exemplar-frontend/blob/master/app/models/address.rb) which sits in an Ohm [Set](http://www.rubydoc.info/github/soveran/ohm/Ohm/Set) on the registration.

The migration script copies the values held on against the root of existing registrations in a new address sub-document held in an array called `addresses`.

```bash
rake data_migration:migrate_address_model
```

### General

The MongoDB host, database name, username and password will be taken from the relevant environment variables; the tasks will stop with an error if any of these are not available.
