#!/bin/sh

git branch -r | awk '{print $1}' | grep -Ev -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
