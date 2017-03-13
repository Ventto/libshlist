#!/bin/sh
#
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
array () {
    for e in $1; do echo "$e"; done
}

array_len () {
    echo "$@" | wc -w
}

array_empty () {
    [ "$(array_len "$@")" -eq 0 ] && return 0; return 1
}

array_add () {
    array_empty "$2" && echo "$1" || printf '%s\n%s' "$2" "$1"
}

array_del () {
    echo "$2" | sed -e "0,/$1/ s///" -e '/^$/d'
}

array_delall () {
    echo "$2" | sed -e "/$1/d"
}

array_get () {
    i=0; for e in $2; do [ "$i" = "$1" ] && { echo "$e"; return 0; }; i=$((i+1)); done
    return 1;
}

array_delindex () {
    e="$(array_get "$1" "$2")"; [ -n "$e" ] && { echo "$2" | sed -e "/$e/d"; }
}

array_indexof () {
    i=0; for e in $2; do [ "$e" = "$1" ] && { echo "$i"; return 0; }; i=$((i+1)); done
    return 1;
}

alias array_contains='array_indexof'

array_head () {
    echo "$@" | head -n1
}

array_last () {
    for last in $1; do true; done; echo "$last"
}

array_occr () {
    i=0; for e in $2; do [ "$1" = "$e" ] && { i=$((i+1)); }; done; echo "$i"
}

array_map () {
    for e in $2; do eval "$1 $e"; done
}
