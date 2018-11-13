# Activation and Expiration

The wording and timings around when exactly a registration is **ACTIVE** and when it is **EXPIRED** can be complex, and there may also be scenarios where what the record reflects and what the actual position is differs.

This page aims to provide clarification and guidance.

It's important to understand the time notation around [midnight](https://en.wikipedia.org/wiki/Midnight). This page uses [24 hour time](https://en.wikipedia.org/wiki/24-hour_clock) notation to try and be clear. Essentially 00:00 denotes the start of the specified date. 24:00 denotes the end of the specified date.

## Activation

For both upper and lower tier registrations we ignore the time element of when a registration is activated. So a registration that is marked active on 22 Jan 2015 at 14:35 is officially active from 00:00 22 Jan 2015.

### Lower tier

A lower tier registration is officially **ACTIVE** once the user completes the registration. It's not marked as such in the record however until the user confirms their email address at the end of the account creation step.

This does cause problems with users not realising this, and there have been occasions in the past where scripts have been run to mark lower tier records awaiting activation as active.

### Upper tier

An upper tier registration is officially **ACTIVE** once

- the registration is complete
- the balance on the registration is £0.00
- any flags added during registration have been removed via confirmation in the internal systems

Users do not have to verify their email address for a registration to become active.

## Expiration

### Lower tier

Lower tier registrations never expire. Once activated they remain so until they are revoked either by the user or the Environment Agency.

### Upper tier

An upper tier registration expires 3 years from the date of activation. So a registration that is marked **ACTIVE** on 22 Jan 2015 at 14:35 is officially

- active from 00:00 22 Jan 2015
- expires at 24:00 21 Jan 2015
- is expired at 00:00 22 Jan 2015

We rely on a [background job](https://github.com/DEFRA/waste-carriers-service/wiki/Background-jobs:-expired-registrations) to actually mark registrations as expired, and it typically runs at 8pm. It used to have a flaw where it selected those to be expired by querying for any with an expiry date less than the time the job was run. This meant any with an expiry time after 8pm were not picked up, granting them an extra day.

This has since been rectified. This background job is part of the waste carriers service, and as such is at risk of failing should the app go down. As such any logic that checks whether a registration is expired should never rely solely on whether the status is set to `EXPIRED`.
