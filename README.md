POSIX Shell List
================

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Ventto/posix-shell-list/blob/master/LICENSE)

*"This is a POSIX Shell list implementation."*

# Usage

* Download it:

```bash
$ wget https://raw.githubusercontent.com/Ventto/posix-shell-list/master/list.sh
```

* Source the library into your script:

```bash
. list.sh
```

# Functions

**Warning:
There is no check on arguments. Prior to respect the API.**

```
list 'string'                       : Creates a new list
list_add "$elt" "$lst"              : Adds an element
list_contains "$elt" "$lst"         : Returns 0 if element found else 1
list_del "$elt" "$lst"              : Deletes the first-hit element
list_delall "$elt" "$lst"           : Deletes all elements
list_delindex "$index" "$lst"       : Deletes the index of a list
list_empty "$lst"                   : Returns 0 if empty else 1
list_get "$index" "$lst"            : Prints the element from its index
list_head "$lst"                    : Prints the first element
list_indexof "$elt" "$lst"          : Prints the index of an element
list_insert "$elt" "$index" "$lst"  : Inserts an element at a given index
list_last "$lst"                    : Prints the last element
list_len "$lst"                     : Prints the length of a list
list_map "$func" "$lst"             : Maps a list using a function
list_occur "$elt" "$lst"            : Counts the number of elements
```
