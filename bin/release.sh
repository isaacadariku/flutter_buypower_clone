#!/bin/bash
# This script is used to rebase the develop branch on top of the main branch

# Check if the current branch is develop
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "dev" ]; then
    echo "You must be on the develop branch to run this script"
    exit 1
fi

# Check if the current branch is up to date with the remote then pull the latest changes
git fetch
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Already up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi

# Rebase the main branch on top of the develop branch
git checkout main
echo "Rebasing main branch on top of develop branch"
git rebase dev

echo "Pushing main branch to remote"
git push

echo "Switching back to develop branch"
git checkout dev
