# Grace window

Upper tier waste carrier registrations incur a charge to register them, and expire every 3 years. However before they expire users have the opportunity to renew them for a lesser charge.

What this page describes is the 'grace window', the period during which a registration is 'expired' but users can still start the renewal process.

## Current window

The current window is *5 days* after the registration has expired (see [Activation and Expiration](activation_expiration.md) for specifics on when a registration expires).

For example if the a registration expires on 1 Oct 2018, then the registration

- was ACTIVE on Sept 30, and EXPIRED on Oct 1
- can still be renewed from Oct 1 to Oct 5 at the latest

There could be some confusion because 1 + 5 = 6, but it's important to remember that a registration is expired on its expiry date. Hence the 5 day grace window includes Oct 1.

## Configuration

The value is managed via an environment variable, so should it need to change it should just be a case of updating the env var `WCRS_REGISTRATION_GRACE_WINDOW`
