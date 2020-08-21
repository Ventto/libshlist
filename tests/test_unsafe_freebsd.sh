#!/bin/sh

# Test to make sure BSD sed and GNU sed work for
# list insertion. Assumes that both version of
# sed are present in PATH

set -e

. ./liblist_unsafe.sh


insert_test() {
  type sed
  lst="$(list 'C' 'A' 'B')"
  lst_expected="$(list 'D' 'C' 'A' 'B')"

  list_insert lst "D" 0

  if [ "$lst" == "$lst_expected" ]; then
    echo "test: insert pass"
    return 0
  else
    echo "test: insert fail"
    return 1
  fi
}

insert_test_gsed() {
  # Keep gsed override wrapped
  sed() {
      gsed "$@"
  }
  # Make sure this doesnt pollute other tests
  insert_test
  unset -f sed
}

insert_test
echo '--------------------------'
insert_test_gsed
