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

### Removing a version tag

If you need to cancel a release and no longer need the version tag, delete it with the following commands:

`git push --delete origin v1.1.7`
`git push --delete v1.1.7`

This makes sure the release list only contains real releases.

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

You must submit an RFC, or "request for change", using MyIT.

Select the following options to begin an RFC:

"Normal Change" > "Initiate RFC" > "New" (button on top)

### Emergency, expedited and normal RFCs

There are three types of changes. This is based on how much notice you are giving for the change.

- Emergency - release within 3 working days
- Expedited - release in 4-10 working days
- Normal - release in 2 weeks' time or later

You can't change the type once you've selected it.

### Filling in the form

The easiest thing to do is to look up an earlier RFC for the Configuration Item "Waste Carriers, Dealers, Brokers" and copy from that.

However, if you are filling in a new form, be sure to fill in the fields as follows:

- Category - "software"
- Environment - "production"
- Configuration item - "Waste Carriers, Dealers, Brokers".
- Short descriptions - "Deploy service changes" (plus "fix data issues" if release includes a data fix)
- Description – copy the opening section from an earlier RFC. For each repo involved, add the name of repo, a link to the CHANGELOG, then copy and paste from changelog for each repo affected. You may need to tidy up formatting. If including data fixes, describe each one in a bullet point.

Fill in all the fields in the "Planning" tab.

Put in a planned start and end date. We usually start at 10 and end at 10:10.

Hit the "Save for later" button regularly. This saves your work, but also checks if there are scheduling conflicts.

Only click the "Validate" button when the RFC is ready, as this will not only validate the RFC, but submit it for approval. "Save for later" before submitting to make sure there is no scheduling clash.

## Set up a calendar invite

Create a calendar event for when the release is scheduled.

Invite:

- the head of Web Ops
- the person in Web Ops who will be handling deployment
- developers and testers in the delivery team (as optional attendees)

In the body of the event, include the RFC number and which jobs should be run as part of the deployment.

If the release includes a data fix as part of a new Jenkins job, then add a README to the Tools repo in GitLab. This should include details about the deployment process, including which jobs to run. Check the repo for previous release note READMEs and follow the same format.

Once the README has been merged into master, copy its contents to the calendar invite. Include a link to the README on GitLab.

## Once the RFC is approved

Confirm with WebOps that it's been approved and everyone is still happy to proceed.

Do not ship anything unless the RFC has been approved.

## Release day

Communication on release day usually takes place in the waste carriers channel on the Web Ops Slack.

Web Ops will begin the release at the agreed time. They will usually say when they are starting the release and once it is completed.

When all the jobs have run, someone from the delivery team (usually QA) will run a smoke test to make sure the release has shipped and that everything is working as expected, then confirm with Web Ops.

## After a successful release

Update the RFC to say that the release was a success.

For any repos included in the release (excluding the engine), create a new release on GitHub using the version tag.
