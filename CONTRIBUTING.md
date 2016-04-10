# Contributing

If you have an idea you'd like to contribute please log an issue.

If you'd like to suggest a change contributions should be submitted via a pull request.

## What not to include

- Deployment guides or details
- Details of infrastructure
- Details about any service's back office processes
- Personal contact information

If in doubt speak to **Alan Cruikshanks** before creating the PR.

## Checking your work

We recommend using [markdown-spellcheck](https://www.npmjs.com/package/markdown-spellcheck) to check content for spelling errors. Call it in the following way `mdspell --en-gb --ignore-numbers --ignore-acronyms --report '**/*.md'`. This ensures

- You are using en-gb as your language `--en-gb`
- Numbers are not reported as false positives `--ignore-numbers`
- Acronyms are not reported as false positives `--ignore-acronyms`
- You avoid the default interactive mode `--report`

The last option is needed because our guides feature code examples. **markdown-spellcheck** includes them in the checks because it does not handle text in backticks. You'd have to deal with a large number of false positives which would be slow to go through and might put you off writing more guides. We want to avoid that! So currently it's not part of the build but we hope to include it if this feature becomes available.

For now it'll simply report all errors and you can then deal with actually spelling errors directly.

We use [markdownlint](https://github.com/mivok/markdownlint) to check the files have a consistent style as part of a CI process. We check contributions using `mdl --style md_style.rb $PWD`. We recommend you install this and run it before pushing your commits.

## Getting feedback

Feedback will be provided by the team within the PR. Decisions will be documented and reasons given.

We're a team that want to encourage others to suggest ways we can improve. We'll always endeavour to be positive and professional with any comments we make about your contribution, but let us know if you feel we failed.
