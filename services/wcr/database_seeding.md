# Database seeding

Each of the apps contain database seeds, though they are for local development and testing purposes only. In all cases the seeding is based on reading JSON files that contain the data to be seeded, so its easy to customise it and add your own.

## Waste carriers frontend

Running `bundle exec rake db:seed` in the frontend project will seed the database with backend users e.g. agency-super@wcr.gov.uk.

## Waste carriers back office

Running `bundle exec rake db:seed` in the back office project will seed the database with back office users e.g. bo-user@wcr.gov.uk

## Waste carriers front office

Running `bundle exec rake db:seed` in the front office will do 2 things

- populate the database with external users e.g. user@example.com
- populate the database with a series of example registrations that are ready for renewal

The seeding for the registrations contains some extra logic depending on certain flags set in the `.json` seed file.

### reg_identifier

If no `reg_identifier` is provided, the app will generate one on seeding. These are incremental and based on the tier, so CBDU1 will be followed by CBDU2 or CBDL2, and so on.

The counter for `reg_identifier` numbers is stored in the registrations database.

Else you can specify a `reg_identifier`. We typically do this to support our automated acceptance testing that relies on expected registrations existing in the database. The `reg_identifier`s have to be unique, and are loaded first to avoid clashing with the automatically-generated `reg_identifier`s other seeds may have.
