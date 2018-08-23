# Markdown

When writing markdown the overall goal is to make the content as accessible to the *reader* as possible. The guide below is to provide some consistency for an *editor* working across various projects.

TL;DR Make it nice, but try and be consistent with the guide if you can.

## Style guide

Use *atx* style headers instead of *Setex*, and don't close them.

```markdown
# Use atx style headers

# Don't close them #

Don't use Setext style
======================
```

When inlining a code example just use single backticks.

````markdown
Do this `generate_foo()`
Don't do this ```generate_foo()```
````

Use **-** (hyphen) for unordered lists instead of ***** (asterisk).

When leading into a list or code block don't put a period, colon or semi-colon at the end of the leading sentence.

````markdown
Lead into a code block like this

```ruby
generate_foo()
```

Not like this:

```ruby
generate_foo()
```
````

When mentioning tools or gems, link to them on first reference and then highlight them in *bold*.

Don't attempt to manually wrap lines, for example at 80 characters.
