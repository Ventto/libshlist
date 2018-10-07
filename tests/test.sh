#!/bin/sh

. ./liblist.sh

print_list () {
    echo '==========List============'
    printf "%s\n" "$1"
    echo '--------------------------'
    printf "Size: %s\t\n\n" "$(list_size "$1")"
}

Test_Delete () {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    \
                '3'     '-3'    '33'    \
                '1'     '12'    '-55'   \
                '123'   '-1002' '-1'   )"

    printf "TEST: Deletion\n\n"
    echo 'test: Initialization'; print_list "$lst"

    lst="$(list_remove '1' "$lst")"         ; echo 'test:' ; print_list "$lst"
    lst="$(list_erase '33' "$lst")"         ; echo 'test:' ; print_list "$lst"
    lst="$(list_eraseat '3' "$lst")"        ; echo 'test:' ; print_list "$lst"
    lst="$(list_pop_front "$lst")"          ; echo 'test:' ; print_list "$lst"
    lst="$(list_pop_back "$lst")"           ; echo 'test:' ; print_list "$lst"
    lst="$(list_erase_from '8' "$lst")"     ; echo 'test:' ; print_list "$lst"
    lst="$(list_erase_range '1' '2' "$lst")"; echo 'test:' ; print_list "$lst"
    lst="$(list_erase_range '0' '0' "$lst")"; echo 'test:' ; print_list "$lst"
    lst="$(list_extract '1' '3' "$lst")"    ; echo 'test:' ; print_list "$lst"
    lst="$(list_extract '1' '30' "$lst")"   ; echo 'test:' ; print_list "$lst"
    lst="$(list_extract '1' '0' "$lst")"    ; echo 'test:' ; print_list "$lst"
}

Test_Addition () {
    lst=

    printf "TEST: Addition\n\n"
    echo 'test: Initialization'; print_list "$lst"

    lst="$(list_push_front '12' "$lst")"    ; echo 'test:' ; print_list "$lst"
    lst="$(list_push_back '33' "$lst")"     ; echo 'test:' ; print_list "$lst"
    lst="$(list_push_front '1' "$lst")"     ; echo 'test:' ; print_list "$lst"
    lst="$(list_insert '23' '2' "$lst")"    ; echo 'test:' ; print_list "$lst"
    lst="$(list_push_back '215' "$lst")"    ; echo 'test:' ; print_list "$lst"
}

inc () { i="$1"; i=$((i+1)); echo "${i}"; }
Test_Set() {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    )"

    printf "TEST: Set\n\n"
    echo 'test: Initialization'; print_list "$lst"

    lst="$(list_reverse "$lst")"            ; echo 'test:' ; print_list "$lst"
    lst="$(list_sort "$lst")"               ; echo 'test:' ; print_list "$lst"
    lst="$(list_sort_reverse "$lst")"       ; echo 'test:' ; print_list "$lst"
    lst="$(list_map inc "$lst")"            ; echo 'test:' ; print_list "$lst"
    lst="$(list_replace '2' '999' "$lst")"  ; echo 'test:' ; print_list "$lst"
    lst="$(list_set '999' '3' "$lst")"      ; echo 'test:' ; print_list "$lst"
    lst="$(list_set '999' '6' "$lst")"      ; echo 'test:' ; print_list "$lst"
}

Test_Get() {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    )"

    printf "TEST: Get\n\n"
    echo 'test: Initialization'; print_list "$lst"

    printf 'test: elt='     ; list_front "$lst"
    printf 'test: elt='     ; list_back "$lst"
    printf 'test: elt='     ; list_get '2' "$lst"
    printf 'test: index='   ; list_indexof '1' "$lst" | grep -E '^[0-9]+$' || echo
    printf 'test: index='   ; list_indexof '-456' "$lst" | grep -E '^[0-9]+$' || echo
    printf 'test: contains='; list_contains '1236' "$lst" && echo 'yes' || echo 'no'
    printf 'test: contains='; list_contains '999' "$lst" && echo 'yes' || echo 'no'
    printf 'test: count='   ; list_count '1' "$lst"
    printf 'test: count='   ; list_count '215' "$lst"
    printf 'test: empty='   ; list_empty "$lst" && echo 'yes' || echo 'no'
}
