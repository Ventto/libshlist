POSIX Shell List
================

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Ventto/libshlist/blob/master/LICENSE)

*"This is a POSIX Shell list implementation."*

## Perks

* [x] **No requirement**: Shell POSIX-compliant
* [x] **Lightweight**: ~100 lines
* [x] **Both**: Safe and unsafe (passing argument by reference)

# Installation

* Download it:

```bash
$ wget https://raw.githubusercontent.com/Ventto/libshlist/master/liblist.sh
```

* Source the library for including the functions into your Shell script:

```bash
. liblist.sh  (or)
. liblist_unsafe.sh
```

Each function is independent. So you can copy some functions into your script
without sourcing.

# Functions

The whole function documentation is in the following library scripts:

* `liblist.sh` requires variable assignation
* `liblist_unsafe.sh` uses the `eval` Shell builtin for passing argument
   by reference

The following list enumerates all available functions:

```
                SAFE                |           UNSAFE
____________________________________|_______________________________
list <elt> <elt> ...                |  list <elt> <elt> ...
list_back <lst>                     |  list_back <lst>
list_contains <elt> <lst>           |  list_contains <lst> <elt>
list_count <elt> <lst>              |  list_count <lst> <elt>
list_empty <lst>                    |  list_empty <lst>
list_erase <elt> <lst>              |  list_erase <lst> <elt>
list_erase_from <index> <lst>       |  list_erase_from <lst> <index>
list_erase_range <from> <to> <lst>  |  list_erase_range <lst> <from> <to>
list_eraseat <index> <lst>          |  list_eraseat <lst> <index>
list_extract <from> <to> <lst>      |  list_extract <lst> <from> <to>
list_front <lst>                    |  list_front <lst>
list_get <index> <lst>              |  list_get <lst> <index>
list_indexof <elt> <lst>            |  list_indexof <lst> <elt>
list_insert <elt> <index> <lst>     |  list_insert <lst> <elt> <index>
list_maps <func> <lst>              |  list_maps <lst> <func>
list_pop_back <lst>                 |  list_pop_back <lst>
list_pop_front <lst>                |  list_pop_front <lst>
list_push_back <elt> <lst>          |  list_push_back <lst> <elt>
list_push_front <elt> <lst>         |  list_push_front <lst> <elt>
list_remove <elt> <lst>             |  list_remove <lst> <elt>
list_replace <new> <old> <lst>      |  list_replace <lst> <new> <old>
list_reverse <lst>                  |  list_reverse <lst>
list_set <elt> <index> <lst>        |  list_set <lst> <elt> <index>
list_size <lst>                     |  list_size <lst>
list_sort <lst>                     |  list_sort <lst>
list_sort_reverse <lst>             |  list_sort_reverse <lst>
```

# Examples

* Safe:

```bash
lst="$(list 'C' 'A' 'B')"
lst="$(list_sort "$lst")"           # { A, B, C }

index="$(list_indexof 'B' "$lst")"  # Empty String if not found
printf '"B": found at %d\n' "$index"
```

* Unsafe:

```bash
lst="$(list 'C' 'A' 'B')"
list_sort lst                    # { A, B, C }

index="$(list_indexof lst 'B')"  # Empty String if not found
printf '"B" found at %d\n' "$index"
```

See also scripts in `tests/` as examples.
