# barncat config file
# if these variables are removed the script will break

# maybe you're one of those ".markdown" or ".htm" people
markdown_ext='.md'
html_ext='.html'

# bash commands, filename placed after string when ran
markdown_converter='markdown'
html_cleanup='tidy -w 0 --tidy-mark no -m'

# where are things located?
# ensure it ends with a "/"
input='./input/'
output='./output/'
layouts='./layouts/'
cache='./.cache/'

# enforce a specific layout on files
# when unspecified, layout defaults to default.html
declare -A layout
# layout[path/to/files/]=layout.html
layout[blog/]=blog-post.html
layout[about/]=about-page.html

# generate indices
declare -A index
# index[index-name]="path/to/files/ variable-to-sort-by"
index[blog-roll]=("blog/"
                  "* [{{ title }}]({{ url }}) ({{ creation-date }})"
                  "{{ creation-date }}")
