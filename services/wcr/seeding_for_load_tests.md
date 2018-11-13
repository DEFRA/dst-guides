# Seeding the database(s) with data prior to load tests

> Created to support load testing prior to the release of upper tier registrations in March 2015, the service was required to undergo load testing. Too support this rake tasks were created that could create registrations using random data. The intention was to better reflect a 'real' service by ensuring the database was not empty prior to the test running.
>
> However our experience was that these tasks proved extremely brittle, and as of now (November 2018) are out of date. We've also never used them again. Therefore they simply need to be deleted, along with this guide.

## Populating the database(s) with semi-random data**

This can be done using the tasks implemented `performance_testing` rake namespace:

- `rake performance_testing:seed_lower_tier_registrations[100]` will create 100 semi-randomised lower-tier registrations.
- `rake performance_testing:seed_upper_tier_registrations[500]` will create 500 semi-randomised upper-tier registrations.
- `rake performance_testing:seed_ir_renewals[100]` will create 100 IR renewals of each "type": Company, Person, Organisation of Individuals and Public Body (400 in total).
- `rake performance_testing:seed_convictions[100]` will create 100 conviction records.  Approximately 20% of the records will be for individuals, whilst the remaining 80% will be for companies.  About 20% of the individuals will not have a known date-of-birth.
- `rake performance_testing:seed_phase_one_lower_tier_registrations[100]` will create 100 phase 1 semi-randomised lower-tier registrations. Approximately 50% will be have a status of 'PENDING' and the remaining, 'ACTIVE'.

In all cases, omitting the trailing square-brackets-and-number is allowed, and will create the default number of the appropriate record (the default is 10).  New registrations are added to existing registrations; no data is deleted.

The elements that are randomised include names, email addresses, phone numbers, addresses and dates-of-birth.  Note that the randomised address will not be a valid UK address, and the randomised phone number may also not be a valid phone number.

Upper tier registrations will have been "paid for" via Bank Transfer.

All registrations will correspond to a Limited Company, and the location data (latitude and longitude) will be left at their default values of 1 degree each (although the northing and easting values are randomised).
