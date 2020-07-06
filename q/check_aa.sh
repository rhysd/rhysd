#!/bin/bash

set -e
quine="$(ruby aa.rb)"
set -x
diff -u <(ruby -e "$quine") <(echo "$quine")
