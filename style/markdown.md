# Markdown

Use *atx* style headers instead of *Setex*, and don't close them.

    # Use atx style headers

    # Don't close them #

    Don't use Setext style
    ======================

When inlining a code example just use single backticks.

    Do this `generate_foo()`
    Don't do this ```generate_foo()```

Use **-** (hyphen) for unordered lists instead of ***** (asterisk).

When leading into a list or code block don't put a period, colon or semi-colon at the end of the leading sentence.

    Lead into a code block this

    ```ruby
    generate_foo()
    ```

    Not like this:

    ```ruby
    generate_foo()
    ```

When mentioning tools or gems, link to them on first reference and then highlight them in *bold*.
