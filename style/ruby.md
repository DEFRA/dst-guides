# Ruby

We follow the Ruby style guide below:

<https://github.com/bbatsov/ruby-style-guide>

- Use the latest version of Ruby 2.4 when starting a new project.
- Ruby projects should be well tested, with a meaningful suite of unit tests.
- [Run bundle update every week](https://www.quora.com/How-do-large-companies-ensure-that-their-Ruby-gem-files-and-Rails-version-are-constantly-kept-up-to-date). The tests will let you know if the upgrade broke anything.

## Tools

- Use [brakeman](http://brakemanscanner.org/) to check for vulnerabilities in your project and dependencies
- Use [rubocop](https://github.com/bbatsov/rubocop) to check code style
  - When starting a new Ruby project, copy our [config file](ruby/.rubocop.yml) to the project root directory

## Rails

Use the latest version of Rails 4 when starting a new project.

We follow best practices described here:

<https://github.com/bbatsov/rails-style-guide>
