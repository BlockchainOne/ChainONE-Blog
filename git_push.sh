#!/bin/bash

MEMO=$1

# Auto push
git add -A . && git commit -m "$MEMO" && git push origin master
