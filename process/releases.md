# Releases

By releasing we mean deploying something to production. This won't go into the external governance around doing this, for example raising a *Request for Change*. It will provide a guide on how to prepare git based projects for release.

It also assumes you are following the guidance in [workflows](workflows.md) and [pull requests](pull_request.md) when working on a repo.

## Applications & libraries

By *application* we mean a web application or service that is executed and runs in an environment.

The general principles for releasing these are

- you [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) the application's repo when you have changes you are ready to release
- you deploy to production using *tags* instead of *branches*

If a library we have created is also published to a package manager such as [npm](https://www.npmjs.com/) or [rubygems](https://rubygems.org/), it should follow these same principles. If its not published but the repo is instead directly linked to, then you can ignore this release process.

### What is a tag

In short a tag is an alias for a commit hash, and is used to mark specific points in a repo's git history. Typically its used to mark release points hence its use here.

### Creating a tag

To tag a repo you first need to create the tag locally and then push it to GitHub, in much the same way as creating a new branch

```bash
git tag -a v1.4 -m "Version 1.4"
git push origin v1.4
```

The argument `v1.4` can actually be whatever you like, but you should follow [semantic versioning](https://semver.org/) when deciding what tag to apply. The `-m "Version 1.4"` is simply a message or description you can store with the tag. If you omit this argument git will display your default editor instead, just as if you were adding a commit message.

With the repo tagged and the new tag pushed to GitHub, its now ready to be deployed.

### Deploying the tag

Projects using [Capistrano](https://capistranorb.com/) or [Shipit](https://github.com/shipitjs/shipit) for deployment are all set to deploy using tags. Each supports using a tag name in place of a branch name when specifying what to deploy.

If you are doing deployments manually, you will need to do the equivalent of

```bash
git clone https://github.com/DEFRA/waste-carriers-front-office.git
cd waste-carriers-front-office
git fetch --all --tags --prune
git checkout v1.4
```

This will put the repo at the point in the git history the tag aliases to.
