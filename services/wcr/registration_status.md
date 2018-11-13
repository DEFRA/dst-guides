# Registration status

When we talk about status we're talking about two things; the actual status set against a registration in the database, and the status it shows when searched for in the back office system. This page covers both types

## Database status

A waste carrier registration can have one of 6 statuses

- [ACTIVE](#active)
- [EXPIRED](#expired)
- [INACTIVE](#inactive)
- [PENDING](#pending)
- [REFUSED](#refused)
- [REVOKED](#revoked)

This is held in the `metaData.status` field of a registration.

### ACTIVE

A lower tier registration is `ACTIVE` once the user has confirmed their email address. Until then it remains as `PENDING` and not visible on the public register.

An upper tier registration is `ACTIVE` once it has been paid for, and any match flags have been approved. Users are **not** required to confirm their email address for the registration to become `ACTIVE`.

### EXPIRED

Lower tier registrations never expire so no lower tier registration should have this status.

Upper tier registrations [expire after 3 years](activation_expiration.md) from date of activation. How this is done is via a [job](background_jobs.md) that runs nightly in the Java services looking for expired registrations. Any it finds it marks as `EXPIRED`.

### INACTIVE

A registration is marked as `INACTIVE` when the **Delete** option is used by the user (when signed in) or the **De-register** option by NCCC in the back office. Both upper and lower tier registrations can be de-registered and once done, cannot be marked as anything else.

### PENDING

A registration is `PENDING` whilst it is awaiting further actions to be completed to process the registration, and whilst no other actions have been taken. So a lower tier registration will remain as `PENDING` until the email is confirmed. An upper tier will remain as `PENDING` until it is paid, and if flagged approved.

### REFUSED

Only `ACTIVE` upper tier registrations which have been flagged by the matching service can be refused. When refused, users are required to provide a reason why the registration is being marked as `REFUSED`, which is captured in `metaData.revokedReason`.

Once `REFUSED` a registration can still be **Approved**. Again a reason must be given and this overrides the message in `metaData.revokedReason`. The registration will then be marked as `PENDING` if payment is outstanding, or `ACTIVE`.

### REVOKED

Only `ACTIVE` upper tier registrations can be revoked. When selected, users are required to provide a reason why the registration is being marked as `REVOKED`, which is captured in `metaData.revokedReason`.

The registration can still be **De-registered** (see `INACTIVE`). It can also be 'Un-revoked'. Again a reason must be given and this overrides the message in `metaData.revokedReason`.

## Back office status

When you search for a registration in the back office, against each result a status will be displayed.

- Awaiting payment
- Conviction check
- De-registered
- Pending
- Refused
- Registered
- Revoked

### Awaiting payment

Shown for a `PENDING` upper tier registration whose balance is not 0, most likely because online payment was not used when completing it.

### Conviction check

An upper tier `PENDING` registration which either declared a conviction or was flagged by our matching service. It may also have an outstanding payment, but this status takes priority.

### De-registered

Any registration (lower or upper) which has been de-registered so has a database status of `INACTIVE`.

### Pending

Shown for lower tier registrations with a database status of `PENDING` because the user has not confirmed their email yet. Upper tier registrations can also be pending, but you won't see that shown in the back office because they will be pending for other reasons e.g. **Awaiting payment** or **Conviction check**.

### Refused

Shown for any upper tier registration with a status of `REFUSED`.

### Registered

Any registration (lower or upper) which has a database status of `ACTIVE`.

### Revoked

Any registration (lower or upper) with a database status of `REVOKED`.
