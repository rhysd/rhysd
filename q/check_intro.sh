#!/bin/bash

set -ex
diff -u <(ruby intro.rb) <(cat intro.rb)
