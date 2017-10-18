#!/bin/sh

. ./list.sh

list_test () {
    lst="$1"
    printf "Prints lst:\n%s\n\n" "$lst"
    printf "Length of lst: %s\n" "$(list_len "$lst")"
    printf "lst[1]: %s\n" "$(list_get 1 "$lst")"
    printf "lst[2]: %s\n" "$(list_get 2 "$lst")"
    printf "Index of 'e4': %s\n" "$(list_indexof 'e4' "$lst")"
    printf "Index of 'e2': %s\n" "$(list_indexof 'e2' "$lst")"
    printf "Index of 'foo': %s\n" "$(list_indexof 'foo' "$lst")"

    lst="$(list_del 'e3' "$lst")"
    printf "Delete 'e3':\n%s\n\n" "$lst"

    lst="$(list_del 'e' "$lst")"
    printf "Delete 'e':\n%s\n\n" "$lst"

    lst="$(list_del '4' "$lst")"
    printf "Delete '4':\n%s\n\n" "$lst"

    lst="$(list_delindex '2' "$lst")"
    printf "Delete lst[2]:\n%s\n\n" "$lst"

    lst="$(list_add 'e5' "$lst")"
    printf "Add 'e5':\n%s\n\n" "$lst"

    list_contains 'e5' "$lst" && resp='yes' || resp='no'
    printf "Contains 'e5' ? %s\n" "$resp"

    list_contains 'e3' "$lst" && resp='yes' || resp='no'
    printf "Contains 'e3' ? %s\n" "$resp"

    printf "Head of list:%s\n" "$(list_head "$lst")"
    printf "Last of list:%s\n" "$(list_last "$lst")"

    lst="$(list_add 'e2' "$lst")"
    printf "Add 'e2':\n%s\n" "$lst"
    printf "How many 'e2':\n%s\n" "$(list_occr 'e2' "$lst")"

    lst="$(list_del 'e2' "$lst")"
    printf "Delete 'e2':\n%s\n\n" "$lst"

    lst="$(list_insert 'e2' '0' "$lst")"
    printf "Insert 'e2' at [0]:\n%s\n\n" "$lst"
    lst="$(list_insert 'e2' '2' "$lst")"
    printf "Insert 'e2' at [2]:\n%s\n\n" "$lst"
    printf "How many 'e2': %s\n" "$(list_occr 'e2' "$lst")"

    lst="$(list_delall 'e2' "$lst")"
    printf "Delete all 'e2':\n%s\n\n" "$lst"
    printf "How many 'e2': %s\n" "$(list_occr 'e2' "$lst")"
    printf "Map::<echo>:\n%s\n" "$(list_map 'echo' "$lst")"
}

echo "\n==== Not Empty ====\n"
lst="$(list "e1 e2 e3 e4")"
list_test "$lst"

echo "\n==== Empty ====\n"
lst=
list_test "$lst"


