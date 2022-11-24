#!/bin/sh
escapedPath="$(echo `pwd` | sed 's/\//\\\//g')"

if [ -d "coverage" ]; then
  # combine line coverage info from package tests to a common file
  if [ ! -d "$MELOS_ROOT_PATH/coverage" ]; then
    mkdir "$MELOS_ROOT_PATH/coverage"
  fi
  sed "s/^SF:lib/SF:$escapedPath\/lib/g" coverage/lcov.info >> "$MELOS_ROOT_PATH/coverage/lcov.info"
  rm -rf "coverage"
fi

