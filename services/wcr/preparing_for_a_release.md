# Preparing for a release

First, go through all the git repos (including renewals) and do a `git checkout master` & `git pull` to make sure you are working with the latest versions.

## Check your merged PRs

Review the merged PRs that will be included in this release and make sure they have been tagged appropriately (eg `enhancement`, `bug`).

This will allow us to sort different types of changes when the CHANGELOG is generated.

## Create version tags

We use version tags to tell Jenkins which release to deploy.

The engine does not need a version tag as it is not deployed directly, but all applications should have one.

We use semantic versioning to differentiate between patch, minor and major releases. You can find out what the last version number was by going to the repo on GitHub and looking at its releases page.

Create a new version tag in the command line:

`git tag -a v1.1.7 -m "Version 1.1.7"`

Then push the tag to GitHub.

`git push origin v1.1.7`

Tag the version before you submit the RFC, but _don't_ create a release in GitHub until after shipping is complete.

## Update the CHANGELOG

All applications and the engine should have a CHANGELOG, which is updated with every release.

You must create the version tag before you update the CHANGELOG (the only exception to this is the engine).

To update the changelog, make sure you are on the master branch, and then run the following:

- `bundle install`
- `bundle exec rake changelog`
- `git add CHANGELOG.md`
- `git commit -m "Update CHANGELOG"`
- `git push`

Make sure you have a [GitHub personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/) set up, or you will hit a request limit. This should be set to `CHANGELOG_GITHUB_TOKEN` in your local environment variables.

## Update the Jenkins deploy job

Find the PRE-PROD job to deploy the app.

In the `Properties content` box, update `DEPLOY_BRANCH` to the new tag (eg `v1.1.7`). Then save your changes.

## Contact Web Ops

Before submitting an RFC, check with Web Ops and make sure they can deploy on that date.

Post in the waste carriers channel on the Web Ops slack and say when you'd like to deploy.

Once you have confirmed the date, you can submit an RFC.

## Submit an RFC

Do this on MyIT.
