#!/bin/bash

# finds the tag file directory hiearchy
# first parameter: dir
function is_tags_file_in_this_dir {
    if [ -z $(ls -1 ${1} |grep tags) ]; then
        # tags file was not found 
        echo 1
    else
        # tags file was found 
        echo 0
    fi
}

CURRENT_DIR=$(pwd)

while true; do

    if [ "${CURRENT_DIR}" == "${HOME}" ]; then
        echo -n "x"
        exit 1
    fi

    if [ "$(is_tags_file_in_this_dir ${CURRENT_DIR})" == "0" ]; then
        ctags -R ${CURRENT_DIR} > /dev/null 2>&1 
        echo -n "${CURRENT_DIR}/tags"
        exit 0
    fi

    cd ..
    CURRENT_DIR=$(pwd)
done

