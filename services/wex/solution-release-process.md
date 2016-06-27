# Solution release process

This details the process of updating each of the projects that make up the Waste Exemptions service solution.

It's focus is the **code**, not the release process itself e.g. submitting a *Request for Change*, ensuring deployment is followed by a [smoke test](https://en.wikipedia.org/wiki/Smoke_testing_(software)). The aim is to document that in the guides at a later date.

## [Digital services core](https://github.com/EnvironmentAgency/digital-services-core)

- When ready for release create branch off `master` called *release/update_to_version_x-x-x*.

- Push empty commit as normal with message

> Update version to x.x.x ready for release
>
> As part of releasing a new version of the Waste exemptions registration service we are also updating and tagging the engines it uses so we have a clear understanding of what is being used in production.

- Update the version number (normally found in `lib/engine_name/version.rb`) to match

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Ensure `master` is checked out and then create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Waste exemptions shared](https://github.com/EnvironmentAgency/waste-exemptions-shared)

- When ready for release create branch off `master` called *release/update_to_version_x-x-x*.

- Push empty commit as normal with message

> Update version to x.x.x ready for release
>
> As part of releasing a new version of the Waste exemptions registration service we are also updating and tagging the engines it uses so we have a clear understanding of what is being used in production.

- Update the version number (normally found in `lib/engine_name/version.rb`) to match

- Update the reference to **Digital Services Core** in the `Gemfile` to point to latest tag

```ruby
gem 'digital_services_core',
  git: 'https://github.com/EnvironmentAgency/digital-services-core.git',
  tag: 'vx.x.x'
```

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Ensure `master` is checked out and then create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Front office core](https://github.com/EnvironmentAgency/front-office-core)

Simply follow the same process as [Waste exemptions shared](#waste-exemptions-shared).

## [Back office core](https://github.com/EnvironmentAgency/back-office-core)

Simply follow the same process as [Waste exemptions shared](#waste-exemptions-shared).

## [Waste exemptions](https://github.com/EnvironmentAgency/waste-exemptions)

- When ready for release create branch off `develop` called *release/update_to_version_x-x-x*.

- Push empty commit as normal with message

> Update version to x.x.x ready for release
>
> This covers all work required to prepare the Waste exemptions registration service for its next release.

- Update the version number (normally found in `config/initializers/version.rb`) to match

- Update the references to the core gems in the `Gemfile` to point to latest tag

```ruby
## EA/GovUK gems
gem 'digital_services_core',
  git: 'https://github.com/EnvironmentAgency/digital-services-core',
  tag: 'vx.x.x'

# Core components for EA Front Office services
gem 'front_office_core',
  git: 'https://github.com/EnvironmentAgency/front-office-core',
  tag: 'vx.x.x'

# Core components for WasteExemptions
gem 'waste_exemptions_shared',
  git: 'https://github.com/EnvironmentAgency/waste-exemptions-shared',
  tag: 'vx.x.x'
```

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Locally checkout `develop` and `git pull` to get latest changes

- Then checkout `master` and merge `develop` into it `git merge develop`

- Push `master` using `git push` (no need to force push)

- Create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Waste exemptions back office](https://github.com/EnvironmentAgency/waste-exemptions-back-office)

Simply follow the same process as [Waste exemptions](#waste-exemptions) only change the initial empty commit message to be

> Update version to x.x.x ready for release
>
> This covers all work required to prepare the Waste exemptions registration back office service for its next release.

And update the references to the core gems as follows

```ruby
## EA/GovUK gems
gem 'digital_services_core',
  git: 'https://github.com/EnvironmentAgency/digital-services-core',
  tag: 'vx.x.x'

# Core components for EA Back Office services
gem 'back_office_core',
  git: 'https://github.com/EnvironmentAgency/back-office-core',
  tag: 'vx.x.x'

# Core components for WasteExemptions
gem 'waste_exemptions_shared',
  git: 'https://github.com/EnvironmentAgency/waste-exemptions-shared',
  tag: 'vx.x.x'
```

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
