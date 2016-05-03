# Developer Workflows

We use different workflows depending on the type of project. Essentially they are

- [Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) for Rails applications
- [Feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) for gems and engines (also known as [GitHub flow](https://guides.github.com/introduction/flow/))

## Gitflow

We use Gitflow for anything that is **deployed**. Currently this is the front end Rails applications we build, which to the public are our digital services, and internal users our back office systems.

<img src="gitflow.svg" alt="Git flow" style="width: 600px;"/>
<sub>https://www.atlassian.com/git/images/tutorials/collaborating/comparing-workflows/gitflow-workflow/05.svg</sub>

Using this workflow it means our branches have specific uses

- **Master** is the version of code that is in production

- We create a **Hotfix** branch when we need to make a change to production code because of a critical error. When finished we merge the change back into Master, but also Develop

- **Develop** is the main branch the developers work from. It represents the current version of the code, including new features we’ve completed but not yet released

- A **Feature** branch is started each time we want to add or update a feature in the code. We branch off Develop when creating the feature, and once complete merge it back into Develop

- Once we have a set of features we want to put live, we create a **Release** branch. Last minute fixes and tidying up is done on this branch and then it is merged into Master (put live) and back into Develop

## Feature branch workflow (GitHub flow)

We use this for anything which is referenced by something in production, but not directly deployed itself, for example gems and engines.

<img src="githubflow.png" alt="GitHub flow" style="width: 600px;"/>
<sub>https://guides.github.com/activities/hello-world/branching.png</sub>

Using this workflow we only use two branches

- **Master** is the main branch developers work from. It represents the latest version of the code. The key principle is that master should never be broken. Anything merged in needs to have been peer reviewed and passed by CI

- A **Feature** branch is started each time we want to add or update a feature in the code. We branch off Master when creating the feature, and once complete merge it back into Develop

## All branches

In all cases when the branch is created it should be pushed up to the **origin** repo and a pull request created as per the [pull request](/process/pull-request) process.
