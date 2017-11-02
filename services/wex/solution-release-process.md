# Solution release process

This details the process of updating each of the projects that make up the Waste Exemptions service solution.

It's focus is the **code**, not the release process itself (i.e. the submission of a *Request for Change*, ensuring deployment is followed by a [smoke test](https://en.wikipedia.org/wiki/Smoke_testing_(software)). The aim is to document that in the guides at a later date.

## [Waste exemptions](https://github.com/DEFRA/waste-exemptions)

- When ready for release create branch off `develop` called *release/x-x-x*.

- Create empty commit as normal (`git commit --allow-empty`) with message

> Release of version x.x.x
>
> Creating a production ready release of the Waste exemptions front office service.

- Push it to GitHub `git push -u origin release/x-x-x`

- Go to <https://github.com/DEFRA/waste-exemptions> and you should see the **Compare & pull request** button. Click it to create the pull request 

- Increment the version number (normally found in `config/initializers/version.rb`)

- Ensure the [waste_exemptions_shared](https://github.com/DEFRA/waste-exemptions-shared) gem has been updated to the latest by running `bundle update waste_exemptions_shared`

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Locally checkout `develop` and `git pull` to get latest changes

- Checkout `master` and do a `git pull` (just to make sure you have the latest)

- Merge `develop` into it `git merge develop`

- Push `master` using `git push` (no need to force push)

- Create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Waste exemptions back office](https://github.com/DEFRA/waste-exemptions-back-office)

Follow the same process as [Waste exemptions](#waste-exemptions) only change the initial empty commit message to be

> Release of version x.x.x
>
> Creating a production ready release of the Waste exemptions back office service.

## Questions

### Why is Waste exemptions shared not covered?

We used to follow the same process of preparing and tagging releases for the **Waste Exemptions Shared** project as well, and in fact this would be the first stage in the process for a release.

However on review we found there was additional work and complexity in doing this, and we weren't getting anything in return. The `Gemfile.lock` in both the front and back office projects will tell us exactly what version of shared is deployed to production, and as we don't release it as a gem there is no other reason for creating tagged releases.

Hence it is no longer part of the process, and the front and back office `Gemfile`s simply point to the master branch of **Waste exemptions shared**.

### Why manual Git flow

Essentially the front office and back office releases are following [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) and there is even a [tool](https://github.com/nvie/gitflow) to help with this.

However because we have examples of discrepancies between builds passing locally but not on our CI servers, we need to push our `release` branches to GitHub to enable our CI servers to test the service.

This means we cannot use the git flow tool locally as it expects to handle the merging of the branches, and this would leave us with PR's that could not be finished which we see as messy.

Therefore using the process outlined above

- Our CI services can still access the changes and run our automated builds
- We use the same [pull request process](/process/pull_request.md)
- Any team member can generate a new release. Because of protected branches on the repo only an admin user would be able to do so if using gitflow locally (negates issue of [bus factor](https://en.wikipedia.org/wiki/Bus_factor))
- The release change shows up in our pull request history
