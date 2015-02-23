#!/bin/bash
# Prevents force-pushing to master
# Initialize for each repo with git init

BRANCH=`git rev-parse --abbrev-ref HEAD`
PUSH_COMMAND=`ps -ocommand= -p $PPID`
PROTECTED_BRANCHES="^(master|dev|release-*|patch-*)"
FORCE_PUSH="force|delete|-f"

echo "Pre hook was run"
if [[ "$BRANCH" =~ $PROTECTED_BRANCHES ]]; then
  read -p "You're about to push to \"$BRANCH\", are you sure you to continue (y/n)" -n 1 -r < /dev/tty
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    exit 0
  fi
  exit 1
fi

exit 0
