#!/bin/bash
# Warn before pushing to protected branches
# Initialize for each repo with git init
# Bypass with git push --no-verify

BRANCH=`git rev-parse --abbrev-ref HEAD`
PUSH_COMMAND=`ps -ocommand= -p $PPID`
PROTECTED_BRANCHES="^(master|dev|release-*|patch-*)"
FORCE_PUSH="force|delete|-f"

if [[ "$BRANCH" =~ $PROTECTED_BRANCHES ]]; then
  read -p "You're about to push to \"$BRANCH\", are you sure you to continue (y/n)" -n 1 -r < /dev/tty
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    exit 0
  fi
  echo "Push aborted."
  exit 1
fi

exit 0
