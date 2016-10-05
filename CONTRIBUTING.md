# Contributing

If you have an idea you'd like to contribute please log an issue.

If you'd like to suggest a change contributions should be submitted via a pull request.

If you have any questions or need to discuss or check anything contact us via the [#dst-guides](https://defra-digital.slack.com/messages/dst-guides/) channel in [Slack](https://defra-digital.slack.com/).

## What not to include

- Deployment guides or details
- Details of infrastructure
- Details about any service's back office processes
- Personal contact information

If in doubt speak to [Alan Cruikshanks](https://github.com/cruikshanks) or [Ben Sagar](https://github.com/bensagar-ea) before creating the PR.

## Getting started

Create a branch. Prefix it with `feature` or `fix` depending on whether your adding or enhancing a guide, or correcting an error or omission. Use a brief but descriptive name e.g. `feature/add-more-details-for-contributors`.

Start committing your changes and **push** straight away rather than when finished.

## Checking your work

### Spelling errors

We recommend using [markdown-spellcheck](https://www.npmjs.com/package/markdown-spellcheck) to check content for spelling errors. Call it in the following way `mdspell --en-gb --ignore-numbers --ignore-acronyms --report '**/*.md'`. This ensures

- You are using en-gb as your language `--en-gb`
- Numbers are not reported as false positives `--ignore-numbers`
- Acronyms are not reported as false positives `--ignore-acronyms`
- You avoid the default interactive mode `--report`

The last option is needed because our guides feature code examples. **markdown-spellcheck** includes them in the checks because it does not handle text in backticks. You'd have to deal with a large number of false positives which would be slow to go through and might put you off writing more guides. We want to avoid that! So currently it's not part of the build but we hope to include it if this feature becomes available.

For now it'll simply report all errors and you can then deal with actual spelling errors directly.

### Style

We use [markdownlint](https://github.com/mivok/markdownlint) to check the files have a consistent style as part of our CI process. We suggest having a quick look at the [rules](https://github.com/mivok/markdownlint/blob/master/docs/RULES.md) before you start. We check contributions using `mdl --style md_style.rb $PWD`. We recommend you install this and run it before requesting feedback.

## When you're finished

Make sure everything is pushed, then add the **ready for review** label to the PR and ensure you are assigned. Announce your PR in the [#development](https://defra-digital.slack.com/messages/development/) channel in **Slack**.

## Getting feedback

Feedback will be provided within the PR. Decisions will be documented and reasons given.

We want to encourage all to contribute and suggest ways we can improve. Anyone providing feedback should be positive and professional with any comments made about your contribution, but let us know if you feel we failed.

We don't expect everyone to be available or able to contribute but we want to allow enough time for those who wish to get involved. Don't merge your PR for at least 3 days, even if you've had lots of positive feedback.

## Finishing up

Leave the PR open for at least 3 working days and ensure at least one other person has reviewed it.

Once those who have participated in the PR have said they are happy, first **squash** your commits down to a single commit. Then merge it in GitHub (not locally). Don't forget to also delete the branch in GitHub.

Sit back, have a :tropical_drink:, and ponder your next contribution!
