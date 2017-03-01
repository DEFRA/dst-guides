# Work in the open

> _Our code is open as early as possible. We only go private if we really, really, **really** have to!_

[Point 8](https://www.gov.uk/service-manual/service-standard/make-all-new-source-code-open) of the [Digital Service Standard](https://www.gov.uk/service-manual/service-standard) states

> You must make all new source code open to meet point 8 of the Digital Service Standard.

So you *could* develop your code in private, and release in time for a [Beta](https://www.gov.uk/service-manual/agile-delivery/how-the-beta-phase-works) assessment, which (other factors aside) would be sufficient to pass.

However we believe there are more benefits to making code public from the beginning, rather than starting private and releasing later, and we're not the only ones. For example, see this [blog post by the Ministry of Justice on why they code in the open](https://mojdigital.blog.gov.uk/2017/02/21/why-we-code-in-the-open/). Here we cover the reasons why, and who has the authority to release your code.

There is also an internal operational instruction for open sourcing code. Contact [Ben Sagar](https://github.com/bensagar-ea) or [Alan Cruikshanks](https://github.com/Cruikshanks) for a copy.

## Benefits

### Free stuff

Public repositories benefit from lots of free services. Continuous integration, dependency checking, code quality and test coverage are just a few of the things you can get for free if your project is open.

### You've passed

...point 8 of the Digital service standard (if you're a digital service going on [GOV.UK](https://gov.uk)). No last minute rush to release something just before an assessment, you're sorted from day one.

### Flexibility

It's easier to collaborate with colleagues when working on an open repo compared to a private one. Though you may have to grant access to allow them to make changes, there is nothing stopping them from looking at and referring to the code.

### Visibility and sharing

Projects that are open have more visibility which makes it easier for colleagues both in the Environment Agency and in other departments to see what we've built. This encourages collaboration rather than duplication.

It also means the code can benefit more people by being shared. Not only can others use your code they can see which problems you have already solved.

### No re-work

In our experience all projects that started private with the intention of going public later found that additional work was needed before this could happen. Projects that started public however never seem to experience this overhead.

Starting public prevents you from storing up additional work which has to be done, normally at a time where you're priority is actually to get it live.

### Quality

We believe the quality of public projects is better than private ones. Our opinion is based on the belief that

- Access to quality metrics means contributors are less likely to commit code without test coverage
- Documentation is created and updated from the start rather than later, for example when going from private to public
- Developers make more balanced decisions between delivery and quality due to the possibility of public scrutiny
- The code is more secure. It encourages a separation of information, forcing contributors to consider what *really* needs to be protected from that which doesn't.

## Authority to 'go open'

When writing code on a project, authority to release that code falls under the data custodian for the area of the business the service belongs to. Making contact and securing this authorisation should be a priority from the start of Alpha.

You should be open by the time of your alpha assessment, as it will ensure you meet [point 8](https://www.gov.uk/service-manual/service-standard/make-all-new-source-code-open) of the standard, and is an Environment Agency pre-condition to the team starting beta.
