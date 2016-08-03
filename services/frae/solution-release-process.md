# Solution release process

This details the process of updating each of the projects that make up the Flood Risk Activity
Exemptions service solution.

> Please also read the general release guidance and and notes under the
[Waste Exemptions section]((/services/wex/solution-release-process.md))

## [Flood risk engine](https://github.com/EnvironmentAgency/flood-risk-engine)

> Remember that for gems we use *github flow* rather than gitflow; there is no develop branch, and
the end result of the release process is a new tagged version.

- When ready for release create branch off `master` called *release/update_to_version_x-x-x*.

- Push empty commit as normal with message

> Update version to x.x.x ready for release
>
> As part of releasing a new version of the Flood risk activity exemptions
registration service we are also updating and
tagging the engine it uses so we have a clear understanding of what is being used in production.

- Update the version number in `lib/engine_name/version.rb` to match

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- `git checkout master` and bring down the latest changes with `git pull origin master`, then create
  a tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Flood risk front office](https://github.com/EnvironmentAgency/flood-risk-front-office)

> We use *gitflow* for applications - so work is based off of a develop branch

- When ready for release create a branch off of `develop` called *release/update_to_version_x-x-x*.

- Push empty commit as normal with message

> Update version to x.x.x ready for release
>
> This covers all work required to prepare the Flood risk activity exemptions registration
> service for its next release.

- Update the version number in `config/initializers/version.rb` to match

- Update the references to the `flood_risk_engine` gem in the `Gemfile` to point to latest tag

```ruby
  gem "flood_risk_engine",
    git: "https://github.com/EnvironmentAgency/flood-risk-engine",
    tag: "vx.x.x"
```

- Run `bundle install` (**Critical** failure to do so can lead to build issues on the CI server)

- Do a `git add --all` followed by a `git commit --amend`

- Save changes and force push `git push -f`

- Assuming build is successful merge the PR in GitHub

- Locally checkout `develop` and `git pull` to get latest changes

- Then checkout `master` and merge `develop` into it `git merge develop`

- Push `master` using `git push origin master` (no need to force push)

- Create tag `git tag -a vx.x.x -m "Release of x.x.x"`

- Push tag to GitHub `git push origin vx.x.x`

## [Flood risk back office](https://github.com/EnvironmentAgency/waste-exemptions-back-office)

Follow the same process as [Flood risk front office](#user-content-flood-risk-front-office) only change
the initial empty commit message to be

> Update version to x.x.x ready for release
>
> This covers all work required to prepare the Flood risk activity exemptions
> registration back office service for its next release.
