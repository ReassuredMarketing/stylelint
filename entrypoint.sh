#!/bin/sh
set -e

pattern="./src/**/*.scss"

if [ ! -z "${PATTERN}" ]; then
  echo "== ${PATTERN} =="
  pattern=$PATTERN
fi

stylelint_path="node_modules/.bin/stylelint"
if [ ! -e stylelint_path ]; then
  yarn add stylelint stylelint-config-standard --silent
fi

echo "=================================="
echo "stylelint path ${stylelint_path}"
echo "Scanning ${pattern}"
echo "=================================="

sh -c "$stylelint_path $pattern"