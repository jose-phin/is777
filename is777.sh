#!/bin/bash

current_dir=$(pwd)/*/

printf "id,is 777\n" > result.csv
for dir in $current_dir
do
    permission='false'

    if [ "$(stat --format '%a' $dir)" = "777" ]; then
        permission='true'
    fi

    dir=${dir%*/}
    printf "${dir##*/},$permission\n" >> "result.csv"
done