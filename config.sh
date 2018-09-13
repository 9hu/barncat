# barncat config file
# if these variables are removed the script will break

# maybe you're one of those ".markdown" or ".htm" people
markdown_ext='.md'
html_ext='.html'

# bash commands, filename placed after string when ran
markdown_converter='kramdown'
html_cleanup='tidy -q --show-warnings no -w 0 --tidy-mark no -m'

# where are things located?
input='./input'
output='./output'
layouts='./layouts'
cache='./.cache'

# enforce a specific layout on files
# when unspecified, layout defaults to default.html
declare -a layout;
# layout[path/to/files/]=layout.html
layout+=(/blog/ blog-post.html)
layout+=(/ default.html)
