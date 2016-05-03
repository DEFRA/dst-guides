all

# https://github.com/mivok/markdownlint/blob/master/docs/RULES.md#md013---line-length
# We exclude this rule because we believe it is easier to maintain the content
# if there is no limit on line lengths. Most editors can wrap the text and
# GitHub renders the content without issue. If we enforced a limit it would mean
# when editing a paragraph contributors would not only need to edit the content,
# but then also reformat it. We feel this last step is unnecessary.
exclude_rule 'MD013'

# https://github.com/mivok/markdownlint/blob/master/docs/RULES.md#md033---inline-html
# We exclude this rule because our markdown is intended to be viewed on GitHub, and
# ensure that it renders correctly we sometimes need to include inline html.
# The primary example is images, we we wish to resize the original for better
# display in a README file.
exclude_rule 'MD033'
