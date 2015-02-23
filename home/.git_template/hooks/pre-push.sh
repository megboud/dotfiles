#!/bin/bash
# Prevents force-pushing to master
# Initialize for each repo with git init

BRANCH=`git rev-parse --abbrev-ref HEAD`
PUSH_COMMAND=`ps -ocommand= -p $PPID`
PROTECTED_BRANCHES="^(master|dev|release-*|patch-*)"
FORCE_PUSH="force|delete|-f"

if [[ "$BRANCH" =~ $PROTECTED_BRANCHES && "$PUSH_COMMAND" =~ $FORCE_PUSH ]]; then
  echo "Are you sure you want force push to \"$BRANCH\" ?"
  exit 1
fi

exit 0
