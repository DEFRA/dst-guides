# Solution release process

This details the process of updating each of the projects that make up the Waste Exemptions service solution.

It's focus is the **code**, not the release process itself (i.e. the submission of a *Request for Change*, ensuring deployment is followed by a [smoke test](https://en.wikipedia.org/wiki/Smoke_testing_(software)). The aim is to document that in the guides at a later date.

## [Waste exemptions shared](https://github.com/DEFRA/waste-exemptions-shared)

- When ready for release create branch off `master` called *release/x-x-x*.

- Push empty commit as normal with message

> Release of version x.x.x
>
> Creating a production ready release of this gem.

- Increment the version number (normally found in `lib/engine_name/version.rb`)

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Check out master and `git pull`

- Create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Waste exemptions](https://github.com/DEFRA/waste-exemptions)

- When ready for release create branch off `develop` called *release/x-x-x*.

- Push empty commit as normal with message

> Release of version x.x.x
>
> Creating a production ready release of the Waste exemptions front office service.

- Increment the version number (normally found in `config/initializers/version.rb`)

- Ensure the reference to the `waste_exemptions_shared` gem in the `Gemfile` is pointing to the latest tag

```ruby
# Core components for WasteExemptions
gem 'waste_exemptions_shared',
  git: 'https://github.com/DEFRA/waste-exemptions-shared',
  tag: 'vx.x.x'
```

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

### Why manual Git flow

Essentially the front office and back office releases are following [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) and there is even a [tool](https://github.com/nvie/gitflow) to help with this.

However because we have examples of discrepancies between builds passing locally but not on our CI servers, we need to push our `release` branches to GitHub to enable our CI servers to test the service.

This means we cannot use the git flow tool locally as it expects to handle the merging of the branches, and this would leave us with PR's that could not be finished which we see as messy.

Therefore using the process outlined above

- Our CI services can still access the changes and run our automated builds
- We use the same [pull request process](/process/pull_request.md)
- Any team member can generate a new release. Because of protected branches on the repo only an admin user would be able to do so if using gitflow locally (negates issue of [bus factor](https://en.wikipedia.org/wiki/Bus_factor))
- The release change shows up in our pull request history
