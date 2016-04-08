# Introduction

A state machine is a powerful pattern for managing an object's life cycle or journey.

Many of the sites we build follow a similar pattern, where the User must complete each stage
or in state machine terms states, successfully to proceed to the next state, and eventually
to conclusion. The flow is analogous to a Checkout with an Order, a pattern state machines
are perfectly suited to solve.

A number of projects use the term Enrollment, which is analogous to the Order. Enrollment was chosen
as it does not clash with other popular terms in gems such as Registration.

The Enrollment acts as a high level container and entry point for the complete journey, all
 data related to the journey can be reached via the enrollment and its associations.

The state machine is the mechanism we use to define and manage both the life cycle of
 and Enrollment and subsequently the page flow.

## Useful Info

The gem we are using :

- <https://github.com/state-machines/state_machines>
- <https://github.com/state-machines/state_machines-activerecord>

Links :

- <http://stackoverflow.com/questions/5591348/how-to-implement-a-restful-resource-for-a-state-machine-or-finite-automata>
- <http://www.shopify.com/technology/5898287-restful-thinkin>

### Example Definition

The key model is Enrollment, in order to keep files small and readable, we can split the state machine definition
out from the parent models actions and associations in a decorator, which contains only the definition of the state machine.
Here is a simplified, cut down version we'll use to illustrate the key concepts, and how to amend or make changes to the flow

```ruby
DigitalServicesCore::Enrollment.class_eval do
​
  # We use this Array of transitions to dynamically build back and next events for linear journey
  class_attribute :state_transitions
​
  def self.state_transitions
    @state_transitions ||= [
      :unregistered,
      :grid_reference,
      :add_exemptions,
      :user_type,
      :individual_name,
      :individual_address,
      :main_contact_name,
      :applicant_contact,
      :reviewing,
      :declaration,
      :complete
    ]
​
  end
​
  # To avoid a ton of warnings when the state machine is re-defined
  StateMachines::Machine.ignore_method_conflicts = true
​
  # To avoid multiple occurrences of the same transition being defined
  # On first definition, state_machines will not be defined
  state_machines.clear if respond_to?(:state_machines)
​
  state_machine initial: :unregistered do
​
    def get_transitions
      DigitalServicesCore::Enrollment.state_transitions
    end
​
    # Create a 'next' event for each step
    get_transitions.each_with_index do |t, i|
      Rails.logger.debug("Creating next transition : #{t} => #{get_transitions[i+1] }")
      break if t == :complete
      transition( { get_transitions[i] => get_transitions[i+1] }.merge(on: :next) )
    end
​
    # Create a 'back' event for each step
    get_transitions.each_with_index do |t, i|
      next if(t == :complete || i == 0) # no back allowed from here
​
      Rails.logger.debug("Creating back transition : #{t}")
      transition( {t => get_transitions[i - 1] }.merge(on: :back) )
    end
​
​
    # Per State Processing
​
    event :review do
      transition from: all, to: :reviewing
    end
​
    after_transition any => :reviewing do |enrollment, _transition|
      Rails.logger.debug("Transition to reviewing - setting under_review flag")
      enrollment.update! under_review: true
    end
​
    after_transition to: :complete, do: :finalize!
​
  end
```

The **Enrollment** model, will be in a single 'state' at any one time, the initial state, when it it first created is 'unregistered'.  Reviewing the state machine definition we have two other key elements, events and transitions (from one state to another).

The way these concepts map to the actual website, is as follows; the **state** is analogous to a **Page**, so for example choosing_business_sector, state has an associated page. This mapping is actually explicit in the code - we actually create one partial view (page of html) per state, and these views are stored under```app/views/enrollment/states```

The **view** rendering is controlled from the main ```edit``` view, which renders common components and then the state specific partial :

```ruby
    <%= render "enrollments/states/#{@enrollment.state}", form: f %>
````

**Events** can be thought of as the User **clicking the Continue** button on a Page, so for example the 'commence' event is activated when the user chooses 'New registration' and clicks continue.

The **Transitions** define our User journey, how the pages flow, one to the other.

So for example, the 'commence' event causes the state to transition from unregistered to choosing_business_sector i.e. defines our flow as from the 'Choose new/renew' page, to 'Choose Business Sector' page.

Note, changing the flow should now be as straightforward as simply changing the transition definitions - see 'Changes to the User journey' section.

Transitions do not have to be from one single state to another single state. For example the following definition, allows the state to be moved from **ANY state EXCEPT :unregistered** to :reviewing i.e from review we can jump back to any state, to review the details, and from there we can navigate back to the review page.

```ruby
event :review do
      transition from: all - [:unregistered], to: :reviewing
end
```

We can also define methods that are to be run, around or after transitions. A good example is the transition to the complete state :

```ruby
after_transition to: :complete, do: :finalize!
```

This instructs the state machine to run our own **finalize!** method, once the state becomes complete, so within this finalize method we can perform post processing such as marking the Enrollment complete by setting the completed_at date to the current time.

Now we will look at two special elements in the state machine, that dynamically create next and back events for the current state.

```ruby
    # Create a 'next' event for each step
    get_transitions.each_with_index do |t, i|
      Rails.logger.debug("Creating next transition : #{t} => #{get_transitions[i+1] }")
      break if t == :complete
      transition( { get_transitions[i] => get_transitions[i+1] }.merge(on: :next) )
    end
​
    # Create a 'back' event for each step
    get_transitions.each_with_index do |t, i|
      next if(t == :complete || i == 0) # no back allowed from here
​
      Rails.logger.debug("Creating back transition : #{t}")
      transition( {t => get_transitions[i - 1] }.merge(on: :back) )
    end
```

We created a simple array of states , that defines the flow as simple steps, page to page, which we can also  use
to define back and next events, that can be called on any Enrollment model instance - to go forward or back a single step.


## Working with the state machine

You can test whether an event can be fired with the ? operator and events can be triggered explicitly
via the helper methods created for each event. The bang (!) version will raise an exception if the transition fails.

```ruby

@enrollment.commence?

@enrollment.commence

begin
    @enrollment.commence!
rescue
end
```

The same behaviour can also be achieved implicitly by setting the state event attribute

```ruby
@enrollment.state_event = ‘commence’
@enrollment.save
```

**Note** the call to **save** - we do not automatically save the model on a state change,
for better flexibility, this is left as an explicit step.
If you do not call save the model state will revert to the previous state when the model is reloaded from the database.

How to create drop down off all possible states

```ruby
    <div class="field">
      <%= f.label :state %><br />
      <%= f.collection_select :state_event, @enrollment.state_transitions, :event,
                              :human_to_name, :include_blank => @enrollment.human_state_name %>
    </div>
```