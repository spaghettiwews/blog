#!/usr/bin/env bash
curl --user ${CIRCLE_TOKEN}: \
    --request POST \
    --form revision=888781c4faeec4ceacacecf79f9d528db9e9ad19\
    --form config=@config.yml \
    --form notify=false \
        https://circleci.com/api/v1.1/project/github/spaghettiwews/blog/tree/master