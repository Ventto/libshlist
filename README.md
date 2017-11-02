POSIX Shell List
================

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Ventto/posix-shell-list/blob/master/LICENSE)

*"This is a POSIX Shell list implementation."*

## Perks

* [x] **No requirement**: POSIX-compliant
* [x] **Lightweight**: 81 lines
* [x] **Extra**: Additional functions to fit your needs
* [x] **Useful**: No internal independency
* [x] **Safe**: No eval use (but an unsafe version is comming soon)

# Installation

* Download it:

```bash
$ wget https://raw.githubusercontent.com/Ventto/posix-shell-list/master/liblist.sh
```

* Source the library for including the functions into your Shell script:

```bash
. liblist.sh
```

* Each function is independent. So you can copy some functions into your
script:

```bash
list_erase () {
    echo "$2" | sed -e "0,/^$1$/ s///" -e '/^$/d'
}
```

# Functions

Read the function documentation in the script.
The following list enumerates all functions in the library:

```
list <elt> <elt> ...
list_back <list>
list_contains <elt> <list>
list_count <elt> <list>
list_empty <list>
list_erase <elt> <list>
list_erase_from <index> <list>
list_erase_range <from_index> <to_index> <list>
list_eraseat <index> <list>
list_extract <from_index> <to_index> <list>
list_front <list>
list_get <index> <list>
list_indexof <elt> <list>
list_insert <elt> <index> <list>
list_maps <func> <list>
list_pop_back <list>
list_pop_front <list>
list_push_back <elt> <list>
list_push_front <elt> <list>
list_remove <elt> <list>
list_replace <new_elt> <old_elt> <list>
list_reverse <list>
list_set <elt> <index> <list>
list_size <list>
list_sort <list>
list_sort_reverse <list>
```

# Example

`test/test.sh` offers an exhaustive usage of the library.

* Quick start:

```bash
lst="$(list 'A' 'B' 'C')"
lst="$(list_sort "$lst")"

if list_empty "$lst"; then
    echo 'The list is empty.'
fi
```
