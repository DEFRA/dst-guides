# Ruby Services team

A team of awesome furicorns 🦄 dedicated to supporting and improving all Defra digital services built using *Ruby* ❤️ ('cos it's the best)!

## Patterns & principles

There are some things we can agree and check for using [Defra ruby style](https://github.com/DEFRA/defra-ruby-style). There are others though that require more context or judgement.

For those things we have this document.

### Aspirations vs current state

New readers note that you are likely to find examples in the code where we have ***not*** followed an agreed pattern or principle.

Most of the time our decisions form after working with the code base for sometime, and as new members join the team.

So when we document something here it is as a statement of our intent to refactor previous code as per the [boy scout rule](https://www.oreilly.com/library/view/97-things-every/9780596809515/ch08.html), and abide by it for anything new we add.

### Code

#### Service objects

To ensure our services don’t become a kitchen draw of things we are not sure where to put, we have agreed the following.

- An object can be defined as a service if it does only one thing
- The class name should end with `service`, eg `CompletionService`
- They should expose only a single public method called `run()`
- `run()` should accept whatever parameters are needed to complete the action

To support this we define the following base class that all services should inherit.

```ruby
module WasteEngine
  class BaseService
    def self.run(attrs)
      new.run(attrs)
    end
  end
end

module WasteEngine
  class CompletionService < BaseService
    def run(registration)
      create_submitted_registration(registration)
      send_confirmation_email(registration)
      delete_transient_registration(registration)
    end
  end
end
```

#### Object interaction

Where an object needs to interact with another object, that interaction should happen within a private method.

Say we have the following classes

```ruby
class TokenGenerator
  def generate
    ('a'..'z').to_a.shuffle[0,8].join
  end
end

class EntryLog < BaseService
  def log(note)
    token_generator = TokenGenerator.new
    save_to_log(note, token_generator.generate)
  end
  # ...
end
```

If the API for `TokenGenerator` were to change, we'd need to open up the code in `EntryLog.log` and make changes. And if `EntryLog` used it in a number of places that would cause multiple changes.

So we have agreed that when one objects needs to use another, its does so through a private method.

```ruby
class TokenGenerator
  def generate
    ('a'..'z').to_a.shuffle[0,8].join
  end
end

class EntryLog < BaseService
  def log(note)
    save_to_log(note, token)
  end

  private

  def token
    token_generator = TokenGenerator.new
    token_generator.generate
  end
  # ...
end
```

### Tests

#### Traits over setup

We use [Factory Bot](https://github.com/thoughtbot/factory_bot) to create our test objects in Rspec. With factory_bot comes [Traits](https://www.rubydoc.info/gems/factory_bot/file/GETTING_STARTED.md#Traits) which

> [..] allow you to group attributes together and then apply them to any factory.

For example

```ruby
factory :story do
  title { "My awesome story" }

  trait :published do
    published { true }
  end

  trait :unpublished do
    published { false }
  end
end
```

When writing a test and creating an object you can specify which trait to use. Often in new tests there isn't an existing trait, or there is one but you need something else.

```ruby
test_story = build(:story, :published, in_print: false)
```

The issue we have found is that as time goes on, the required conditions of the object may change, and then there is contention as to whether the existing trait gets updated or the test code.

To avoid this our agreed pattern is that *all object setup should be in a trait*.

```ruby
factory :story do
  title { "My awesome story" }

  trait :published do
    published { true }
  end

  trait :unpublished do
    published { false }
  end

  trait :not_in_print do
    in_print { false }
  end

  trait :published_but_not_in_print do
    unpublished
    not_in_print
  end
end

###

test_story = build(:story, :published_but_not_in_print)
```

#### Assemble - Assert - Act

We agree that tests should divide their Assert, Assemble and Act logic using empty lines. For example

```ruby
RSpec.describe SimpleService do
  describe ".run" do
    it "Does A, B and C" do
      required_object = build(:required_object) # Assemble

      result = described_class.run(required_object: required_object) # Act

      expect(result).to have_done(:a) # Assert
      expect(result).to have_done(:b) # Assert
      expect(result).to have_done(:c) # Assert
    end
  end
end
```

### Ways of working

#### Pull requests

Our pull requests follow the standard set out in [DST Guides](https://github.com/DEFRA/dst-guides/blob/master/process/pull_request.md). The TL;DR is

- all changes are made on a branch
- all changes are peer reviewed
- respect your reviewer; keep PR's small and try to have a meaningful commit history
- you only need approval from one team member to merge
- commits are squashed down to one before merging; so make it meaningful

Some other things that are not covered that are particular to our team are

##### Assignment

When you create the PR assign yourself to it. We treat the person assigned as the main contributor, rather than who happens to be working on it at that time. That way we know who to direct any questions or comments to.

##### Draft PR's

We've always considered PR's to be 'work in progress' [WIP] until you request a review. Now GitHub has built in support for [marking a PR as draft](https://github.blog/2019-02-14-introducing-draft-pull-requests/) when you create it.

This will prevent the PR from being merged until you click the 'ready for review' button, and the GitHub UI makes the `draft` status nice and clear in its UI.

So open all new PR's as draft, and avoid adding '[WIP]' to the title or description.

##### Label everything

Label all PR's. We use the labels when generating the CHANGELOGs so its essential every PR gets one.
