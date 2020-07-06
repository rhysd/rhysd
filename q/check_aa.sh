#!/bin/bash

set -e
gen_aa="$(ruby gen_gen_aa.rb)"
aa="$(ruby -e "$gen_aa")"
set -x
diff -u <(ruby -e "$aa") <(echo "$aa")
