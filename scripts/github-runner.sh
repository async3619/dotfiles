#!/bin/bash

# this script should be run with a single argument.
if [ $# -ne 1 ]; then
    echo "Usage: $0 <org_name>"
    exit 1
fi

# check if ~/.github_token exists and not empty.
if [ ! -s ~/.github_token ]; then
    echo "GitHub Token file not found. Please run ~/scripts/github-pat.sh to generate one.";
    exit 1
fi

# get randomized temporary directory name
RANDOM_DIR=$(mktemp -d -t github-runner-XXXXXXXXXX)

# read the token from ~/.github_token
ACCESS_TOKEN=$(cat ~/.github_token)
GITHUB_ORG=$1

docker run -d --restart always --name github-runner \
  -e RUNNER_NAME_PREFIX="async3619-runner" \
  -e ACCESS_TOKEN="${ACCESS_TOKEN}" \
  -e RUNNER_WORKDIR="${RANDOM_DIR}" \
  -e RUNNER_GROUP="Default" \
  -e RUNNER_SCOPE="org" \
  -e DISABLE_AUTO_UPDATE="true" \
  -e ORG_NAME="${GITHUB_ORG}" \
  -e LABELS="home" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${RANDOM_DIR}:${RANDOM_DIR} \
  --name "${GITHUB_ORG}" \
  myoung34/github-runner:latest

