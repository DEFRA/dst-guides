# Pull request

The following outlines how contributors should make changes to the repo. The goals are

- Focused PR's related to specific changes
- Code review is simple and manageable
- A clean tree of changes in the commit history
- Consistency across the commits

We want to respect the time and effort of those reviewing the work. Keeping PR's small, focused and consistent makes their life easier.

## Always on a branch

No matter how small the change, all changes must be done on a branch and never directly to `master` (or `develop` where [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) is being used).

Clone the repo then create your new branch. Please use one of the following prefixes to help categorise the change being made

- `feature` (you're adding new functionality to the service or project)
- `fix` (you're fixing an issue that affects the overall service, or an issue with the project)

If the source of the change is a story, bug or card use its ID at the start of the branch name.

For example `git checkout -b feature/WAS-1023-add-ea-admin-area-lookup`.

The use of the ID is to help collate changes across multiple repositories.

## Start with a commit

Start your new branch with an empty commit.

```bash
git commit --allow-empty
```

The template for the commit is the following

```
50 character limited title

Link to originating story/bug/card in relevant system (e.g. Jira or Trello)

Brief description covering what the change is and why we're making it.
```

For example

```
Add ability to find EA administrative area

https://eaflood.atlassian.net/browse/WAS-1023

The Environment Agency is structured around area teams, who have responsibility for activities in their area. Therefore there is often a need to know which administrative area a location falls into.

This change adds the ability to query a dataset maintained by www.geostore.com on behalf of the EA using an easting and northing to identify the matching EA administrative area.
```

The key point is that it should describe **the actual change you are intending to make** and not just **what change the story outlined**. The link to the story is added for those that need the greater context.

### Set rules

1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line (*Add ability* not *Added ability*)
6. Use the body to explain *what and why* vs. *how*

N.B. The source for these is [How to write a Git commit message](http://chris.beams.io/posts/git-commit/) which you're encouraged to read.

## Let everyone know

Next push your branch.

```bash
git push -u origin feature/add-ea-admin-area-lookup
```

The intention is to create a PR right from the start so that your proposed change is visible to all. This means all other contributors can feedback if they see any issues, and give help and advice if relevant. Better that than a completed PR which has to be canned because of an issue you weren't aware of.

Once pushed you'll need to go to GitHub to actually create the PR. You'll see GitHub automatically takes your first empty commit and uses it to populate the pull request title and description. Nice! You should also assign yourself to the PR so everyone knows the work is with you.

## Now code

Now get on and code. You are advised to commit frequently and push often. Don't worry too much about your commit messages here. They will be used as part of the PR process so don't ignore them completely (no `WIP`, `Still WIP`, `More WIP!` thank you) but also don't start writing mini novellas for each one unless its relevant.

## Keep up to date

It's on you to keep your branch up to date with *master*. Use `rebase` to do this, not `merge`.

```bash
git rebase orign/master
```

Briefly a `rebase` applies your commits to the latest from *master*, a `merge` slots them in amongst the other commits. Hopefully you'll find this https://github.com/ginatrapani/todo.txt-android/wiki/Using-git-rebase helpful in understanding how `rebase` works.

## Get it looked at

When you're finished and have pushed your last commit add a comment along the lines of *Please could someone :eyes: at this PR for me. Thx!*

Another collaborator should then come back to confirm they are doing the PR. The two of you will then work to confirm the changes are ok. When the other collaborator is happy they simply need to add the comment ':ship: it!'

### No ones looking

1. Give it a day for someone to come back. If still nothing add another comment to the PR naming the other collaborators (or better yet speak to the them!) This will cause GitHub to directly ping them via email.
2. If still nothing after day 2 raise it to the team lead.
3. If stuck for something to do whilst waiting - PR!

## Completing the commit

To complete the commit ready for merging later you'll need to `squash` your commits down to one.

The simplest way to do this is with an interactive `rebase`. We've found the easiest way to go about this is doing the following

```bash
git merge-base feature/wex-bo-business-continuity-page origin/master
e622687e3a3f5caf74f354209d646f52efae061f
git rebase -i e622687e3a3f5caf74f354209d646f52efae061f
```

A lot of examples of `rebase` will use something like `git rebase -i HEAD~4`, but this requires you working out how many commits you've made. As we want to squash all commits since we branched of *master* we've found the `merge-base` command the easiest way of figuring out what commit to go back to.

For details on squashing commits and using interactive `rebase` please read [Thoughbot's](https://robots.thoughtbot.com/git-interactive-rebase-squash-amend-rewriting-history) post all about it.

You should be presented with something like this

```
#pick 07c5abd Add new WEX BO business continuity page
pick de9b1eb Create a new file
pick 3e7ee36 Copy in template
pick fa20af3 Update to include content
```

The first will be your empty commit, and the rest everything you've done since. You'll want to set that to look like this;

```
pick 07c5abd Add new WEX BO business continuity page
s de9b1eb Create a new file
s 3e7ee36 Copy in template
s fa20af3 Update to include content
```

When you save and close this (using your git commit editor of choice) you'll then be shown all the commit messages listed above in the same order. Simply update the commit message to take account of anything you did differently from the original plan.

You should also consider converting your commits into a bullet point list of changes added after the commit description block. However abide by the following

- Remove anything which is obvious from the diff e.g. `add method foo to Bar.rb`
- Combine related commits
- Don't list **housekeeping** or [boy scout rule](http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule) changes
- Don't list specs added or state `specs added`
- Use **-** not ***** for the bullets themselves

Because we're rebasing we need to tell GitHub to discard what its got and instead use our new single commit `git push -f`.

## Final step

With the PR having been reviewed by fellow collaborator, and squashed to a single clear commit you as the PR originator can click the *Merge* button in GitHub.

Then make sure to delete your branch in GitHub afterwards (it provides the option right there after merge so no excuses!)

## Exceptions to the rule

- Technical related items such as refactoring can skip the QA stage, but this must have been confirmed with QA before hand
- The PR can contain more than one commit, if for example the change requires further explanation that cannot be covered in a single bullet point. Each commit must still use the template and rules for commit messages though
  - Often whilst working on a branch its easier to also apply other fixes or changes unrelated to the thing you're currently working on. Avoid this and get into the good habit of opening a new PR for that change, it will pay dividends in the long run
