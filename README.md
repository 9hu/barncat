# barncat

Dirt simple website generation for dirt simple websites.

## How does it work?

The `barncat` script duplicates `$dir_input` into `$dir_output` (and removes files not found reversely) with the exception of Markdown files which it converts to HTML.

Markdown files are converted to HTML using
a Markdown conversion program specified (kramdown by default),
a HTML cleanup program specified (tidy by default),
a layout (file stored in `$dir_layouts`),
and fragments (files stored in `$dir_fragments`).

There's a config section at the top of `barncat` where you can specify file extensions, programs, directories to operate on, and more.

### The fragment system

Fragments are stored in `$dir_fragments` and can be inserted into either layouts or Markdown files.
Lines in either of these formatted:

  {{ frag file.txt }}

will be replaced with the file contents of `$dir_fragments/file.txt`.

New/modified fragments won't trigger a regeneration of a file containing them, only new/modified files contain those fragments will be regenerated.
As a result files containing fragments that change should be added explicitly to the `$always_refresh` file list in the `barncat` config.

### The layout system

Layouts are stored in `$dir_layouts` and are named after the directory which they are the layout for.
The layout named `path-to-whatever.html` will become the layout for any Markdown files in (or below) the directory `/path/to/whatever/`.
Any Markdown file in a directory without a corresponding layout will use the layout `default.html`.

A list of variables that can appear in layouts that are taken from the markdown file being generated:

* `{{ content }}` **This is required in every layout.** Where the markdown conversion text will be inserted
* `{{ title }}` Whatever string of text appears on the top line after the `#` in the file
* `{{ modified date }}` The date the file was last modified in the format `YYYY-MM-DD`
* `{{ current date }}` The date the script was ran in the format `YYYY-MM-DD`

## Usage

  chmod +x barncat
  ./barncat

For flags:

  ./barncat --help

### Example

An `example/` directory is provided to exemplify structure and also provide as a testing ground.

## Dependencies

* GNU bash
* Standard Unix utilities

Defaults in the script that can be changed in the config section:

* kramdown
* tidy

## TODO(?)

* Some kind of script-plugin function
* A script for generating index lists of files in certain directories (sans index)
* A script for generating RSS feeds (or borrow one from someone else)
* Some method of getting file creation/birth dates
