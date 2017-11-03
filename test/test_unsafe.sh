#!/bin/sh

. ./liblist_unsafe.sh

print_list () {
    echo '==========List============'
    eval "printf \"%s\\n\" \"\$$1\""
    echo '--------------------------'
    eval "printf \"Size: %s\t\n\n\" \"\$(list_size $1)\""
}

Test_Delete () {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    \
                '3'     '-3'    '33'    \
                '1'     '12'    '-55'   \
                '123'   '-1002' '-1'   )"

    printf "TEST: Deletion\n\n"
    echo 'test: Initialization'; print_list lst

    list_remove lst '1'         ; echo 'test:' ; print_list lst
    list_erase lst '33'         ; echo 'test:' ; print_list lst
    list_eraseat lst 3          ; echo 'test:' ; print_list lst
    list_pop_front lst          ; echo 'test:' ; print_list lst
    list_pop_back lst           ; echo 'test:' ; print_list lst
    list_erase_from lst 8       ; echo 'test:' ; print_list lst
    list_erase_range lst 1 2    ; echo 'test:' ; print_list lst
    list_erase_range lst 0 0    ; echo 'test:' ; print_list lst
    list_extract lst 1 3        ; echo 'test:' ; print_list lst
    list_extract lst 1 30       ; echo 'test:' ; print_list lst
    list_extract lst 1 0        ; echo 'test:' ; print_list lst
}

Test_Addition () {
    lst=

    printf "TEST: Addition\n\n"
    echo 'test: Initialization'; print_list lst

    list_push_front lst '12'    ; echo 'test:' ; print_list lst
    list_push_back lst '33'     ; echo 'test:' ; print_list lst
    list_push_front lst '1'     ; echo 'test:' ; print_list lst
    list_insert lst '23' 2      ; echo 'test:' ; print_list lst
    list_push_back lst '215'    ; echo 'test:' ; print_list lst
}

inc () { i="$1"; i=$((i+1)); echo "${i}"; }
Test_Set() {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    )"

    printf "TEST: Set\n\n"
    echo 'test: Initialization'; print_list lst

    list_reverse lst            ; echo 'test:' ; print_list lst
    list_sort lst               ; echo 'test:' ; print_list lst
    list_sort_reverse lst       ; echo 'test:' ; print_list lst
    list_map lst inc            ; echo 'test:' ; print_list lst
    list_replace lst '2' '999'  ; echo 'test:' ; print_list lst
    list_set lst '999' 3        ; echo 'test:' ; print_list lst
    list_set lst '999' 6        ; echo 'test:' ; print_list lst
}

Test_Get() {
    lst="$(list '1'     '12'    '23'    \
                '33'    '215'   '-456'  \
                '1236'  '1'     '12'    )"

    printf "TEST: Set\n\n"
    echo 'test: Initialization'; print_list lst

    printf 'test: elt='     ; list_front lst
    printf 'test: elt='     ; list_back lst
    printf 'test: elt='     ; list_get lst 2
    printf 'test: index='   ; list_indexof lst '1'      | grep -E '^[0-9]+$' || echo
    printf 'test: index='   ; list_indexof lst '-456'   | grep -E '^[0-9]+$' || echo
    printf 'test: contains='; list_contains lst '1236'  && echo 'yes' || echo 'no'
    printf 'test: contains='; list_contains lst '2'   && echo 'yes' || echo 'no'
    printf 'test: count='   ; list_count lst '1'
    printf 'test: count='   ; list_count lst '215'
    printf 'test: empty='   ; list_empty lst && echo 'yes' || echo 'no'
}

Test_Void() {
    lst="$(list '' '' '')"

    printf "TEST: Void\n\n"
    echo 'test: Initialization'; print_list lst

    printf 'test (void): empty=' ; list_empty lst && echo 'yes' || echo 'no'
    printf 'test (void): size='  ; list_size lst

    list_reverse lst            ; echo 'test:' ; print_list lst
    list_sort lst               ; echo 'test:' ; print_list lst
    list_sort_reverse lst       ; echo 'test:' ; print_list lst
    list_replace lst '2' '999'  ; echo 'test:' ; print_list lst
    list_set lst '999' 3        ; echo 'test:' ; print_list lst
    list_set lst '999' 6        ; echo 'test:' ; print_list lst
    list_map lst inc            ; echo 'test:' ; print_list lst
    list_remove lst '1'         ; echo 'test:' ; print_list lst
    list_erase lst '33'         ; echo 'test:' ; print_list lst
    list_eraseat lst 3          ; echo 'test:' ; print_list lst
    list_pop_front lst          ; echo 'test:' ; print_list lst
    list_pop_back lst           ; echo 'test:' ; print_list lst
    list_erase_from lst 8       ; echo 'test:' ; print_list lst
    list_erase_range lst 1 2    ; echo 'test:' ; print_list lst
    list_erase_range lst 0 0    ; echo 'test:' ; print_list lst
    list_extract lst 1 3        ; echo 'test:' ; print_list lst
    list_extract lst 1 30       ; echo 'test:' ; print_list lst
    list_extract lst 1 0        ; echo 'test:' ; print_list lst
    list_push_front lst '2'     ; echo 'test:' ; print_list lst
    list_push_back lst '4'      ; echo 'test:' ; print_list lst
    list_push_front lst '1'     ; echo 'test:' ; print_list lst
    list_insert lst '3' 2       ; echo 'test:' ; print_list lst
    list_push_back lst '5'      ; echo 'test:' ; print_list lst
}

Test_BadArg() {
    lst="$1"
    printf "TEST: BadArg\n\n"
    echo 'test: Initialization'; print_list lst

    list_push_front lst     ; echo 'test:' ; print_list lst
    list_push_front  ''     ; echo 'test:' ; print_list lst
    list_push_front         ; echo 'test:' ; print_list lst

    list_push_back lst      ; echo 'test:' ; print_list lst
    list_push_back ''       ; echo 'test:' ; print_list lst
    list_push_back          ; echo 'test:' ; print_list lst

    list_insert lst ''      ; echo 'test:' ; print_list lst
    list_insert lst         ; echo 'test:' ; print_list lst
    list_insert 2           ; echo 'test:' ; print_list lst

    list_reverse            ; echo 'test:' ; print_list lst
    list_sort               ; echo 'test:' ; print_list lst
    list_sort_reverse       ; echo 'test:' ; print_list lst

    list_replace lst '2'    ; echo 'test:' ; print_list lst
    list_replace lst        ; echo 'test:' ; print_list lst
    list_replace            ; echo 'test:' ; print_list lst

    list_set lst '999'      ; echo 'test:' ; print_list lst
    list_set lst            ; echo 'test:' ; print_list lst
    list_set                ; echo 'test:' ; print_list lst

    list_map lst            ; echo 'test:' ; print_list lst
    list_map inc            ; echo 'test:' ; print_list lst
    list_map                ; echo 'test:' ; print_list lst

    list_remove lst         ; echo 'test:' ; print_list lst
    list_remove '1'         ; echo 'test:' ; print_list lst
    list_remove             ; echo 'test:' ; print_list lst

    list_erase lst          ; echo 'test:' ; print_list lst
    list_erase '33'         ; echo 'test:' ; print_list lst
    list_erase              ; echo 'test:' ; print_list lst

    list_eraseat lst        ; echo 'test:' ; print_list lst
    list_eraseat 3          ; echo 'test:' ; print_list lst
    list_eraseat            ; echo 'test:' ; print_list lst

    list_pop_front          ; echo 'test:' ; print_list lst
    list_pop_back           ; echo 'test:' ; print_list lst

    list_erase_from lst     ; echo 'test:' ; print_list lst
    list_erase_from 8       ; echo 'test:' ; print_list lst
    list_erase_from         ; echo 'test:' ; print_list lst

    list_erase_range lst 0  ; echo 'test:' ; print_list lst
    list_erase_range lst    ; echo 'test:' ; print_list lst
    list_erase_range        ; echo 'test:' ; print_list lst

    list_extract 0 1        ; echo 'test:' ; print_list lst
    list_extract lst 1      ; echo 'test:' ; print_list lst
    list_extract lst        ; echo 'test:' ; print_list lst
    list_extract            ; echo 'test:' ; print_list lst

    printf 'test: elt='     ; list_front    || echo
    printf 'test: elt='     ; list_back     || echo

    printf 'test: elt='     ; list_get lst  || echo
    printf 'test: elt='     ; list_get 2    || echo
    printf 'test: elt='     ; list_get      || echo

    printf 'test: index='   ; list_indexof lst      | grep -E '^[0-9]+$' || echo
    printf 'test: index='   ; list_indexof '-456'   | grep -E '^[0-9]+$' || echo
    printf 'test: index='   ; list_indexof          | grep -E '^[0-9]+$' || echo

    printf 'test: contains='; list_contains lst && echo 'yes' || echo 'no'
    printf 'test: contains='; list_contains '2' && echo 'yes' || echo 'no'
    printf 'test: contains='; list_contains     && echo 'yes' || echo 'no'

    printf 'test: count='   ; list_count lst
    printf 'test: count='   ; list_count '215'
    printf 'test: count='   ; list_count

    printf 'test: empty='   ; list_empty && echo 'yes' || echo 'no'
}

Test_VoidBadArg() {
    Test_BadArg "$(list '' '' '' '')"
}

Test_WithBadArg() {
    Test_BadArg "$(list 1 2 3)"
}
