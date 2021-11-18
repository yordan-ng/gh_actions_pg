#!/bin/bash

json_secrets_str=$1

env_filename="deployment.env"

if [[ "${2,,}" == 'staging' ]]; then

jq -r 'to_entries| map(select(.key | test("^SG_")?)) |map("\(.key[3:])=\(.value|tostring)")|.[]' <<< "$json_secrets_str"$
elif [[ "${2,,}" == 'production' ]]; then

jq -r 'to_entries| map(select(.key | test("^PR_")?)) |map("\(.key[3:])=\(.value|tostring)")|.[]' <<< "$json_secrets_str"$
fi
