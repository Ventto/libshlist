#!/bin/sh

. ./array.sh

array_test () {
    arr="$1"

    echo -n 'Length of array: '
    echo "$(array_len "$arr")"

    echo -n 'Get idx=1: '
    echo "$(array_get 1 "$arr")"

    echo -n 'Get idx=2: '
    echo "$(array_get 2 "$arr")"

    echo -n 'Get idx of "e4": '
    echo "$(array_indexof 'e4' "$arr")"

    echo -n 'Get idx of "e2": '
    echo "$(array_indexof 'e2' "$arr")"

    echo -n 'Get idx of "foo": '
    echo "$(array_indexof 'foo' "$arr")"

    echo 'Delete "e3": '
    arr="$(array_del 'e3' "$arr")"
    echo "$arr"

    echo 'Delete "index 2": '
    arr="$(array_delindex '2' "$arr")"
    echo "$arr"

    echo 'Add "e5": '
    arr="$(array_add 'e5' "$arr")"
    echo "$arr"

    echo -n 'Contains "e3" ?: '
    if array_contains 'e3' "$arr"; then
        echo 'yes'
    else
        echo 'no'
    fi

    echo -n 'Contains "e5" ?: '
    if array_contains 'e5' "$arr"; then
        echo 'yes'
    else
        echo 'no'
    fi

    echo 'Add "e2": '
    arr="$(array_add 'e2' "$arr")"
    echo "$arr"

    echo -n 'How many "e2": '
    echo "$(array_occr 'e2' "$arr")"

    echo 'Delete "e2": '
    arr="$(array_del 'e2' "$arr")"
    echo "$arr"

    echo 'Add 2 x "e2": '
    arr="$(array_add 'e2' "$arr")"
    arr="$(array_add 'e2' "$arr")"
    echo "$arr"

    echo -n 'How many "e2": '
    echo "$(array_occr 'e2' "$arr")"

    echo 'Delete all "e2": '
    arr="$(array_delall 'e2' "$arr")"
    echo "$arr"

    echo -n 'How many "e2": '
    echo "$(array_occr 'e2' "$arr")"
}

echo "\n==== Not Empty ====\n"
arr="$(array "e1 e2 e3 e4")"
array_test "$arr"

echo "\n==== Empty ====\n"
arr=
array_test "$arr"


