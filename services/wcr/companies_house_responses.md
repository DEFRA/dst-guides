# Valid responses from Companies House

The service connects with [Companies House](http://wck2.companieshouse.gov.uk//wcframe?name=accessCompanyInfo) to confirm that a registrant's company or limited liability partnership registration number is valid, and to check the status of the organisation.

Companies House actually returns a multitude of statuses so this page is about recording the business decision as to what responses are valid.

It is based on a detailed response provided by our product owner on 14 December 2017.

## Possible responses

The possible values that Companies House might report are as follows

- `active`
- `dissolved`
- `liquidation`
- `receivership`
- `administration`
- `voluntary-arrangement`
- `converted-closed`
- `insolvency-proceedings`

And sometimes you may also get a 'sub status'

- `transferred-from-uk`
- `active-proposal-to-strike-off`
- `petition-to-restore-dissolved`
- `transformed-to-se`
- `converted-to-plc`

## Explanation of responses

In order to undertake transactions the organisation must fulfil two things

1. They must exist (be anything other than **dissolved**)
1. They must be trading for them to lawfully make a transaction e.g. buy a WCR registration

So on those terms the responses mean

- `active` (exist and trading)
- `dissolved` (does not exist)
- `liquidation` (no longer trading)
- `receivership` (no longer trading)
- `administration` (no longer trading)
- `voluntary-arrangement` (exist and can trade in certain circumstances)
- `converted-closed` (no longer trading)
- `insolvency-proceedings` (no longer trading)

### Sub-statuses

The sub-set of statuses give more detail about a top level status (and we've recorded that detail below) however in terms of business logic the top level is sufficient to determine if an organisation can complete a registration.

- `active-proposal-to-strike-off` - organisation will still be active and trading. Was discussed within the service whether those in this position should be prevented from registering. However the product owner determined as they are still listed as **active** they fulfil the criteria and therefore should not be prevented from registering. We have to accept the risk that they may register and then be subsequently struck off
- `petition-to-restore-dissolved` - is not yet a legal entity and not listed as **active**. This is a sub-status of **dissolved**
- `transformed-to-se` - Means Societas Europaea therefore is now an international company
- `converted-to-plc` - are still active and trading. This is a sub-status of **active**

## Valid responses

Currently the only valid responses i.e. those that will allow a user to progress with their registration are **active** and **voluntary-arrangement**.

The Waste carriers frontend app defaults to accepting only these values, but it can be overridden by setting the environment variable
`WCRS_FRONTEND_ALLOWED_COMPANY_STATUSES`. This is loaded at runtime into the Rails configuration. The front and back office use the waste-carriers-engine, where these values are hard coded.
