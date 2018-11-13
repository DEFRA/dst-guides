# Register as a Waste carrier

To quote the description on the main project README

> The Waste Carrier Registrations Service allows businesses, who deal with waste and thus have to register according to the regulations, to register online. Once registered, businesses can sign in again to edit their registrations if needed.
>
> The service also allows authorised agency users and NCCC contact centre staff to create and manage registrations on other users behalf, e.g. to support 'Assisted Digital' registrations. The service provides an internal user account management facility which allows authorised administrators to create and manage other agency user accounts.

The [start page](https://www.gov.uk/waste-carrier-or-broker-registration) for the service has more details about waste carrier registration in general.

## Team

This service is maintained by the [Ruby services team](https://github.com/orgs/DEFRA/teams/ruby-services).

## High level overview

The service is in a transitional phase. The original service was built as

- web application built in ruby on rails
- service API built in Java Dropwizard

It uses a MongoDb document-orientated database, but also Redis to store inflight registrations

This original implementation is known to have substantial technical debt, with lack of tests, non-adherence to conventions, and poor code quality being the main issues. Also in hindsight the solution is felt to be overly complicated for what was actually needed.

In 2018 renewals functionality was added to the service, but rather than add it to the existing code base two new applications were built. Both were Ruby on Rails web apps; one for external users and the other for internal users.

They were built in accordance with what has become our standard model for Rails based digital services. Two host web apps that mount a Rails engine which contains the core functionality.

<img src="service-structure-2018-09-19.svg" alt="Waste carriers service structure" style="width: 600px;"/>

## Repositories

Currently the service is made up of the following repositories

- [Waste carriers frontend](https://github.com/DEFRA/waste-carriers-frontend) - Original Ruby on Rails web app that includes both external and internal user functionality. Handles new registrations.
- [Waste carriers service](https://github.com/DEFRA/waste-carriers-service) - Java back end RESTful services layer built using Dropwizard. The intention was to build a thin client with all logic based in the API, however this never happened. Now serves as essentially a data access layer for registrations.
- [OS Places address lookup](https://github.com/DEFRA/os-places-address-lookup) - Java web app built using Dropwizard which provides a facade to the OS places API. We're the only service that uses it. All subsequent services used the [Address Facade Service](https://github.com/DEFRA/ea-address-facade) or go direct
- [Waste carriers renewals](https://github.com/DEFRA/waste-carriers-renewals) - Rails engine which contains the renewals journey including all models, and is built to be mounted by a host Rails web app
- [Waste carriers front office](https://github.com/DEFRA/waste-carriers-front-office) - Ruby on rails web app used by external users wishing to renew a registration. Mounts the renewals engine
- [Waste carriers back office](https://github.com/DEFRA/waste-carriers-back-office) - Ruby on rails web app used by internal users to support renewals. They can complete renewals as part of assisted digital support using the app as it mounts the renewals engine. But it also includes functionality for approving conviction matches, adding payments, and searching for and viewing renewals.

## Additional info

The following pages hold additional information about the service.

- [Activation and Expiration](activation_expiration.md)
- [Airbrake](airbrake.md)
- [Background jobs](background_jobs.md)
- [Database seeding](database_seeding.md)
- [Entity matching](entity_matching.md)
- [Grace window](grace_window.md)
- [Importing IR records](importing_ir_records.md) ***defunct***
- [Key people](key_people.md)
- [Maintenance mode](maintenance_mode.md) ***defunct***
- [Making a payment with WorldPay](payment_with_worldpay.md)
- [Migrations](Migrations) ***defunct***
- [Organisation type translation matrix](org_type_matrix.md)
- [Registration status](registration_status.md)
- [Renewals](renewals.md)
- [Renewal window](renewal_window.md)
- [Seeding for load tests](seeding_for_load_tests.md) ***defunct***
- [Supported http requests](supported_http_requests.md)
- [Valid responses from Companies House](companies_house_responses.md)
