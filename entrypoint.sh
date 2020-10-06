#!/bin/sh

set -e

configPath="./"
indentSpaces=4
pattern="*.scss"

if [ ! -z "${CONFIG_PATH}" ]; then
  configPath=$CONFIG_PATH
fi
if [ ! -z "${INDENT_SPACES}" ]; then
  indent_spaces=$INDENT_SPACES
fi
if [ ! -z "${PATTERN}" ]; then
  pattern=$PATTERN
fi

stylelint_path="./src"
if [ ! -e stylelint_path ]; then
  yarn add stylelint stylelint-config-standard --silent
fi

if [ ! "$(echo ${configPath}.stylelintrc*)" != "${configPath}.stylelintrc*" ]; then
  echo "{
  \"extends\": \"stylelint-config-standard\",
  \"rules\": {
    \"indentation\": "$indentSpaces"
  }
}" > .stylelintrc
fi

echo ::addPath::${stylelint_path}

echo $pattern
sh -c "$stylelint_path $pattern"