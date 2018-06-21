#!/bin/bash
ln -sf "$PWD/test.sh" .git/hooks/pre-push

function check_return_code {
    rc=$?
    if [[ $rc != 0 ]]
    then
        exit $rc
    fi
}

pylint motherjokes
check_return_code

pytest motherjokes
check_return_code

exit 0