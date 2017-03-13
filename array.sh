#!/bin/sh
# The MIT License (MIT)
#
# Copyright (c) 2015-2016 Thomas "Ventto" Venriès <thomas.venries@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Creates a new array : array 'string'
array () {
    for e in $1; do echo "$e"; done
}

# Prints the length of an array : array_len "$arr"
array_len () {
    echo "$@" | wc -w
}

# Returns 0 if empty else 1 : array_empty "$arr"
array_empty () {
    [ "$(array_len "$@")" -eq 0 ] && return 0; return 1
}

# Adds an element : array_add "$elem" "$arr"
array_add () {
    array_empty "$2" && echo "$1" || printf '%s\n%s' "$2" "$1"
}

# Deletes the first-hit element : array_del "$elem" "$arr"
array_del () {
    echo "$2" | sed -e "0,/$1/ s///" -e '/^$/d'
}

# Deletes all elements : array_delall "$elem" "$arr"
array_delall () {
    echo "$2" | sed -e "/$1/d"
}

# Prints the element from its index : array_get "$index" "$arr"
array_get () {
    i=0;
    for e in $2; do
        [ "$i" = "$1" ] && { echo "$e"; return 0; }; i=$((i+1))
    done
    return 1;
}

# Deletes the index of an array : array_delindex "$index" "$arr"
array_delindex () {
    e="$(array_get "$1" "$2")"; [ -n "$e" ] && { echo "$2" | sed -e "/$e/d"; }
}

# Prints the index of an element : array_indexof "$elem" "$arr"
array_indexof () {
    i=0;
    for e in $2; do
        [ "$e" = "$1" ] && { echo "$i"; return 0; }; i=$((i+1));
    done
    return 1;
}

# Returns 0 if element found else 1 : array_contains "$elem" "$arr"
array_contains () {
    array_indexof "$1" "$2" > /dev/null
}

# Prints the first element : array_head "$arr"
array_head () {
    echo "$@" | head -n1
}

# Prints the last element : array_last "$arr"
array_last () {
    for last in $1; do true; done; echo "$last"
}

# Counts the number of elements : array_occur "$elem" "$arr"
array_occr () {
    i=0; for e in $2; do [ "$1" = "$e" ] && { i=$((i+1)); }; done; echo "$i"
}

# Maps an array using a function : array_map "$func" "$arr"
array_map () {
    for e in $2; do eval "$1 $e"; done
}
