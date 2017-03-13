POSIX Shell Array
=================

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Ventto/posix-shell-array/blob/master/LICENSE)

*"This is a POSIX Shell array implementation."*

# Download

```bash
$ wget https://raw.githubusercontent.com/Ventto/posix-shell-array/master/array.sh
```

# How to

* Add the following line to your script:

```bash
. array.sh
```

* Look at `test.sh` as examples.


# Functions

**Warning:
There is no check on the number of arguments. Prior to respect the API.**

```
array 'string'                  : Creates a new array
array_add "$elem" "$arr"        : Adds an element
array_contains "$elem" "$arr"   : Returns 0 if element found else 1
array_del "$elem" "$arr"        : Deletes the first-hit element
array_delall "$elem" "$arr"     : Deletes all elements
array_delindex "$index" "$arr"  : Deletes the index of an array
array_empty "$arr"              : Returns 0 if empty else 1
array_get "$index" "$arr"       : Prints the element from its index
array_head "$arr"               : Prints the first element
array_indexof "$elem" "$arr"    : Prints the index of an element
array_last "$arr"               : Prints the last element
array_len "$arr"                : Prints the length of an array
array_map "$func" "$arr"        : Maps an array using a function
array_occur "$elem" "$arr"      : Counts the number of elements
```
