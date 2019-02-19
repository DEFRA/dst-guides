# Working with engines in Ruby on Rails

Our Rails-based applications follow a similar structure:

- an engine gem containing the main user journey
- a 'front office' application which mounts the engine and contains additional functionality for external users
- a 'back office' application which mounts the engine and contains additional functionality for internal users

This structure is used by WCR, WEX, FRAE and PAFS.

The Gemfiles of the host applications are configured to use the latest version of the engine's master branch on GitHub. For example:

``` ruby
gem "waste_exemptions_engine",
    git: "https://github.com/DEFRA/waste-exemptions-engine",
    branch: "master"
```

## Preparing engine changes for review

The latest version of master won't be included in your host app until you run `bundle install` to update the engine gem.

If you've made a change in the engine and it's now ready for QA/Test, it's best to make sure the host apps are updated so everyone can actually see the change.

You can do this yourself by running `bundle install` in the host apps, but for ease and consistency it's best to get [Dependabot](https://dependabot.com/) to handle it.

We've configured Dependabot to run `bundle install` once a day to update our gems. If it finds a gem update, Dependabot creates a new PR with the update. It's up to a human to review and merge this.

This will also pick up any changes made to the engine master branch.

If you don't want to wait a day for the changes to be picked up, you can go to the Dependabot dashboard, find the repo for the host app and click `Bump Now` to trigger an update.

Once the Dependabot PR has been merged, the host apps should be ready for the engine changes to be reviewed.

## Seeing in-progress engine changes in a host app

Sometimes you'll need to work on a feature which requires simultaneous changes to both the engine and the host app. Or you'll want to make changes to the engine and see how the host app reacts before you merge those changes in to master.

So you'll need to make the host app look at a different branch or version of the engine.

There are a few ways to do this.

### Option 1: Get the engine from a different branch on GitHub

1. Make a new branch in the engine (eg `engine-change` - but a better name than that!).
1. Make changes to the engine code.
1. Commit and push your engine changes to GitHub.
1. Make a new branch in the front office (eg `office-change`)
1. Go to the front office Gemfile and find the engine gem:

   ``` ruby
   gem "waste_exemptions_engine",
       git: "https://github.com/DEFRA/waste-exemptions-engine",
       branch: "master"
   ```

1. Change the name of the branch in the Gemfile from `"master"` to `"engine-change"`
1. Now run `bundle install` to get the latest version of the `engine-change` branch into the front office.
1. Continue this loop of making an edit in the engine, pushing it to GitHub, and running `bundle install` in the front office until you're happy.
1. Get someone to review the `engine-change` branch, linking to the PR for the `office-change` branch if needed.
1. Once `engine-change` is merged in, go back to the front office Gemfile and change the gem branch from `"engine-change"` to `"master"`.
1. `bundle install` again
1. If you made no changes to the front office code (other than fiddling with the Gemfile) then you're done and can delete this branch.
1. If you made changes to the front office code, push them up to GitHub and get a review.

### Option 2: Get the engine from a different local branch

> If you are running the host app in Vagrant, you must have the engine repo in a folder which Vagrant also mounts (eg `wex-vagrant/waste-exemptions-engine`).

1. Make a new branch in the engine (eg `engine-change`)
1. Make a new branch in the front office (eg `office-change`)
1. Go to the front office Gemfile and find the engine gem:

   ``` ruby
   gem "waste_exemptions_engine",
       git: "https://github.com/DEFRA/waste-exemptions-engine",
       branch: "master"
   ```

1. Remove the `git` and `branch` options entirely, and replace them with `path`. This should be the absolute path of the repo on the machine where the app will run (eg local or Vagrant):

   ``` ruby
   gem "waste_exemptions_engine",
       path: "/absolute/path/for/the/waste-exemptions-engine"
   ```

1. Run `bundle install`. The host app will now get the engine directly from the folder on your machine.
1. When you make a change to the engine, restart the host app to see the effects.

The main advantage of this method is that it's faster to see changes you have made locally – you don't need to worry about commits, pushing or pulling from Github.

However, it will only work locally. Pushing this Gemfile to GitHub will result in a broken build as the path will no longer work.

So it's best to only use this when you want to make and check a lot of small changes quickly, and remember to tidy up your Gemfile before you actually commit and push changes. If you want someone to review your work, it'll be much easier for them to do with Option 1.

### Option 3: Change your Bundler config

Rather than modify the project's Gemfile, you can also configure Bundler to ignore what the Gemfile says and instead look for the engine at a local path.

For example, if the name of the engine is `waste_exemptions_engine`:

`bundle config --local local.waste_exemptions_engine /Users/foo123/code/waste-exemptions-engine`

Much like Option 1, this will only pick up engine changes which have been committed (but you don't have to push them to GitHub). It also means you don't have to worry about breaking the build by accidentally committing temporary changes to your Gemfile.

For more information about this method, see [Alan's blog post](https://cruikshanks.co.uk/blog/local-gems-for-local-projects/)
