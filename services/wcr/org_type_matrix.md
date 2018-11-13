# Organisation type translation matrix

Waste carriers for new registrations does not contain the same options for organisation type now used on other services. It also doesn't include an option for overseas companies, something it has to support that other services don't.

We want users to be able to select their appropriate business type as part of the renewing a registration, and to start bringing the service inline with others. However a change to your organisation type might also trigger the need to create a new registration i.e. you are blocked from renewing.

Therefore we need understand in which cases should the new renewals service permit or block someone from renewing.

## The matrix

> If my current registration has a organisation type of 'x', when I select 'y' in the new renewals service will I be allowed to renew?

|                               | Local authority or public body | Limited company | Limited liability partnership | Individual | Partnership | Other organisation | Based overseas |
|-------------------------------|:------------------------------:|:---------------:|:-----------------------------:|:----------:|:-----------:|:------------------:|:--------------:|
|     Sole trader or individual |               No               |        No       |               No              |     Yes    |      No     |         No         |       Yes      |
|                   Partnership |               No               |        No       |              Yes              |     No     |     Yes     |         No         |       Yes      |
|               Limited company |               No               |       Yes       |              Yes              |     No     |      No     |         No         |       Yes      |
|                   Public body |               Yes              |        No       |               No              |     No     |      No     |         No         |       No       |
|         Charity or non-profit |               No               |        No       |               No              |     No     |      No     |         Yes        |       Yes      |
| Local or regulatory authority |               Yes              |        No       |               No              |     No     |      No     |         No         |       No       |
