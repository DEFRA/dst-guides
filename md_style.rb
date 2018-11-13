all

# https://github.com/mivok/markdownlint/blob/master/docs/RULES.md#md013---line-length
# We exclude this rule because we believe it is easier to maintain the content
# if there is no limit on line lengths. Most editors can wrap the text and
# GitHub renders the content without issue. If we enforced a limit it would mean
# when editing a paragraph contributors would not only need to edit the content,
# but then also reformat it. We feel this last step is unnecessary.
exclude_rule 'MD013'

# https://github.com/mivok/markdownlint/blob/master/docs/RULES.md#md033---inline-html
# We exclude this rule because our markdown is intended to be viewed on GitHub,
# and ensure that it renders correctly we sometimes need to include inline html.
# The primary example is images, we we wish to resize the original for better
# display in a README file.
exclude_rule 'MD033'

# https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md#md024---multiple-headers-with-the-same-content
# We alter this rule to allow for what we believe is acceptable content. With
# this param not set the following is flagged
# ## Heading 1
#
# ### Foo
#
# ## Heading 2
#
# ### Foo
#
# As the duplicate headings fall under different sections, we believe this is
# acceptable, and so do others hence this param exists
rule 'MD024', allow_different_nesting: true
