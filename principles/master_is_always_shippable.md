# Master is always shippable

> *The main branch(s) of a project is always in a state of 'shippable to production'*

All work committed to `master` (and `develop` if using [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)) is considered complete and production ready. It has sufficient tests, matches agreed styles, doesn't break the build, has documentation, and is *our best solution* at the time of committing.

## Nothing is perfect

The main principle is anything we commit to `master` we also would be happy to have in production.

However the principle is not that everything committed to `master` is [perfect](http://www.azquotes.com/quote/1118307). The principle understands that each commit was a team's best endeavours, and these were based on their understanding of the problem, their skills, knowledge, and available resources at the time.

## Branches are 'not' finished

The flip side of this is that branches should always be considered unfinished until the author and team have said they are **ready for review**.

This gives them the space to work through ideas, 'hack' whilst they work through problems, violate styles, good naming etc. Basically get on with developing the feature in the way most comfortable and efficient to them.

Once a branch is **ready for review** though, it should be in a production ready state in order to give any reviewer the best chance of checking the work, and to respect their time.
