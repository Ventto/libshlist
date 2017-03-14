#!/bin/sh

. ./list.sh

list_test () {
    lst="$1"

    echo -n 'Length of list: '
    echo "$(list_len "$lst")"

    echo -n 'Get idx=1: '
    echo "$(list_get 1 "$lst")"

    echo -n 'Get idx=2: '
    echo "$(list_get 2 "$lst")"

    echo -n 'Get idx of "e4": '
    echo "$(list_indexof 'e4' "$lst")"

    echo -n 'Get idx of "e2": '
    echo "$(list_indexof 'e2' "$lst")"

    echo -n 'Get idx of "foo": '
    echo "$(list_indexof 'foo' "$lst")"

    echo 'Delete "e3": '
    lst="$(list_del 'e3' "$lst")"
    echo "$lst"

    echo 'Delete "index 2": '
    lst="$(list_delindex '2' "$lst")"
    echo "$lst"

    echo 'Add "e5": '
    lst="$(list_add 'e5' "$lst")"
    echo "$lst"

    echo -n 'Contains "e3" ?: '
    if list_contains 'e3' "$lst"; then
        echo 'yes'
    else
        echo 'no'
    fi

    echo -n 'Contains "e5" ?: '
    if list_contains 'e5' "$lst"; then
        echo 'yes'
    else
        echo 'no'
    fi

    echo 'Add "e2": '
    lst="$(list_add 'e2' "$lst")"
    echo "$lst"

    echo -n 'How many "e2": '
    echo "$(list_occr 'e2' "$lst")"

    echo 'Delete "e2": '
    lst="$(list_del 'e2' "$lst")"
    echo "$lst"

    echo 'Add 2 x "e2": '
    lst="$(list_add 'e2' "$lst")"
    lst="$(list_add 'e2' "$lst")"
    echo "$lst"

    echo -n 'How many "e2": '
    echo "$(list_occr 'e2' "$lst")"

    echo 'Delete all "e2": '
    lst="$(list_delall 'e2' "$lst")"
    echo "$lst"

    echo -n 'How many "e2": '
    echo "$(list_occr 'e2' "$lst")"

    echo 'Map::<echo>: '
    echo "$(list_map 'echo' "$lst")"
}

echo "\n==== Not Empty ====\n"
lst="$(list "e1 e2 e3 e4")"
list_test "$lst"

echo "\n==== Empty ====\n"
lst=
list_test "$lst"


