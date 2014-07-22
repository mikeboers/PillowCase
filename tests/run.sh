#!/bin/bash

self="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"
. "$self/setup.sh"

get_pil
get_pillow

for x in $(ls "$self"/test_*.sh); do
    echo RUNNING $x
    $x || error aborting
done
