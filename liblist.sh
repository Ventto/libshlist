#!/bin/sh
#
# The MIT License (MIT)
#
# Copyright (c) 2017-2018 Thomas "Ventto" Venriès <thomas.venries@gmail.com>
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

##
# @brief    Return a list from argument strings
# @usage    list <elt> <elt> ...
# @print    list
# @return   0
#
list () {
    for e; do [ -n "$e" ] && echo "$e"; done
}

##
# @brief    Prints the number of elements in the list
# @usage    list_size <list>
# @print    positive integer
# @return   0
#
list_size () {
    if [ -z "$1" ]; then echo '0'; else echo "$@" | wc -l; fi
}

##
# @brief    Returns whether the list is empty(1) or not(0)
# @usage    list_empty <list>
# @return   [0|1]
#
list_empty () {
    test -z "$1"
}

##
# @brief    Adds a new element at the beginning of the list
# @usage    list_push_front <elt> <list>
# @print    list
# @return   0
#
list_push_front () {
    if [ "$#" -eq 1 ]; then echo "$1"; else printf '%s\n%s' "$1" "$2"; fi
}

##
# @brief    Adds a new element at the end of the list
# @usage    list_push_back <elt> <list>
# @print    list
# @return   0
#
list_push_back () {
    if [ "$#" -eq 1 ]; then echo "$1"; else printf '%s\n%s' "$2" "$1"; fi
}

##
# @brief    Inserts new elements in the list before a specified position
# @usage    list_insert <elt> <index> <list>
# @print    list
# @return   0
#
list_insert () {
    i="$2"; [ "$i" != '$' ] &&  i=$((i+1)); echo "$3" | sed "${i}i${1}"
}

##
# @brief    Modifies an element from the list at a specified position
# @usage    list_set <elt> <index> <list>
# @print    list
# @return   0
#
list_set () {
    i="$2"; i=$((i+1)); echo "$3" | sed -e "${i}s/.*/$1/"
}

##
# @brief    Extracts a range of elements from the list between two specified
#           positions
# @usage    list_extract <from_index> <to_index> <list>
# @print    list
# @return   0
#
list_extract () {
    i="$1"; j="$2"; i=$((i+1)); j=$((j+1)); echo "$3" | sed -n "${i},${j}p"
}

##
# @brief    Replaces all elements from the list with a specified element
# @usage    list_replace <new_elt> <old_elt> <list>
# @print    list
# @return   0
#
list_replace () {
    echo "$3" | sed -e "s/^$1$/$2/g"
}

##
# @brief    Returns the element at a specified position
# @usage    list_get <index> <list>
# @print    element
# @return   0
#
list_get () {
    i="$1"; i=$((i+1)); echo "$2" | sed -n "${i}p"
}

##
# @brief    Prints the head of the list
# @usage    list_front <list>
# @print    element
# @return   0
#
list_front () {
    echo "$@" | sed -n '1p'
}

##
# @brief    Prints the queue of the list
# @usage    list_back <list>
# @print    element
# @return   0
#
list_back () {
    echo "$@" | sed -n '$p'
}

##
# @brief    Removes the first-hit element from a list
# @usage    list_erase <elt> <list>
# @print    list
# @return   0
#
list_erase () {
    echo "$2" | sed -e "0,/^$1$/ s///" -e '/^$/d'
}

##
# @brief    Removes a range of elements from a list between two specified
#           positions
# @usage    list_erase_range <from_index> <to_index> <list>
# @print    list
# @return   0
#
list_erase_range () {
    i="$1"; j="$2"; i=$((i+1)); j=$((j+1)); echo "$3" | sed "${i},${j}d"
}

##
# @brief    Removes all elements from a specified position
# @usage    list_erase_from <index> <list>
# @print    list
# @return   0
#
list_erase_from () {
    i="$1"; i=$((i+1)); echo "$2" | sed "${i},\$d"
}

##
# @brief    Removes the element at a specified position
# @usage    list_eraseat <index> <list>
# @print    element
# @return   0
#
list_eraseat () {
    i="$1"; i=$((i+1)); echo "$2" | sed "${i}d"
}

##
# @brief    Removes all the elements from the list, which are equal to given
#           element
# @usage    list_remove <elt> <list>
# @print    list
# @return   0
#
list_remove () {
    echo "$2" | sed -e "/^$1$/d"
}

##
# @brief    Removes the first element of the list
# @usage    list_pop_front <list>
# @print    list
# @return   0
#
list_pop_front () {
    echo "$1" | sed '1d'
}

##
# @brief    Removes the last element of the list
# @usage    list_pop_back <list>
# @print    list
# @return   0
#
list_pop_back () {
    echo "$1" | sed '$d'
}

##
# @brief    Prints the index of a specified element
# @usage    list_indexof <elt> <list>
# @print    index if found or empty string
# @return   0
#
list_indexof () {
    i=0
    for e in $2; do
        [ "$e" = "$1" ] && { echo "$i"; return 0; }; i=$((i+1));
    done
}

##
# @brief    Returns whether the list contains a specified element(0) or not(1)
# @usage    list_contains <elt> <list>
# @return   [0|1]
#
list_contains () {
    for e in $2; do [ "$e" = "$1" ] && return 0; done; return 1
}

##
# @brief    Prints the number of a specified element in the list
# @usage    list_count <elt> <list>
# @print    positive integer
# @return   0
#
list_count () {
    i=0; for e in $2; do [ "$e" = "$1" ] && { i=$((i+1)); }; done; echo "$i"
}

##
# @brief    Maps every element of the list
# @usage    list_maps <func> <list>
# @print    list
# @return   0
#
list_map () {
    for e in $2; do eval "$1 $e"; done
}

##
# @brief    Reverses the list
# @usage    list_reverse <list>
# @print    list
# @return   0
#
list_reverse() {
    echo "$1" | sed '1!x;H;1h;$!d;g'
}

##
# @brief    Sorts the list
# @usage    list_sort <list>
# @print    list
# @return   0
#
list_sort () {
    echo "$1" | sort -n
}

##
# @brief    Sorts and reverses the sense of the list
# @usage    list_sort_reverse <list>
# @print    list
# @return   0
#
list_sort_reverse () {
    echo "$1" | sort -nr
}
