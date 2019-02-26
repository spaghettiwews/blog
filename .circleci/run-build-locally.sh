#!/usr/bin/env bash
curl --user ${CIRCLE_TOKEN}: \
    --request POST \
    --form revision=0e8cb394b6f9bed370387d728082f0c9f84dc405\
    --form config=@config.yml \
    --form notify=false \
        https://circleci.com/api/v1.1/project/github/spaghettiwews/blog/tree/master