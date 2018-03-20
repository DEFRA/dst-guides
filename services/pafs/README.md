# Submit your flood or coastal erosion risk management project proposal

This service is more commonly known by its original name Project Application and Funding Service (PAFS).

To quote the description on the main project README

> [PAFS] is used by regional management authorities to apply for funding for flood and coastal risk management projects.

The [main entry page](https://www.gov.uk/guidance/flood-and-coastal-defence-funding-submit-a-project) for the service specifies you can use tghe service to

- submit a project proposal
- update an existing project
- view the status of a proposal

The one difference to other services is that you first must request an account before you can sign in and submit a project proposal. This is also done online via the service.

## High level overview

The service is made up of a external facing Rails web app, and an internal facing Rails web app. Common functionality is maintained in an engine mounted by both web apps.

The data is maintained in PostgreSQL. It uses [Sendgrid](https://sendgrid.com/) to send emails and does **not** currently feature an address lookup (hence no integration to OS Places).

## Repositories

Currently the service is made up of the following repositories

- [PAFS admin](https://github.com/DEFRA/pafs-admin) - the repo for the internal facing admin app
- [PAFS user](https://github.com/DEFRA/pafs-user) - the repo for the external facing app
- [PAFS core](https://github.com/DEFRA/pafs_core) - the repo for the shared rails engine

At one point automated acceptance testing was covered by this repository, however they are now out of date based on late changes to the service (so fail if run)

- [PAFS acceptance tests](https://github.com/DEFRA/pafs-acceptance-tests)
