#!/bin/sh

set -e

configPath="./"
indentSpaces=4
pattern="*.scss"


if [ ! -z "${CONFIG_PATH}" ]; then
  echo "== ${CONFIG_PATH} =="
  configPath=$CONFIG_PATH
fi
if [ ! -z "${INDENT_SPACES}" ]; then
  echo "== ${INDENT_SPACES} =="
  indent_spaces=$INDENT_SPACES
fi
if [ ! -z "${PATTERN}" ]; then
  echo "== ${PATTERN} =="
  pattern=$PATTERN
fi

stylelint_path="node_modules/.bin/stylelint"
if [ ! -e stylelint_path ]; then
  echo "== stylelint_path =="
  yarn add stylelint stylelint-config-standard --silent
fi

if [ ! "$(echo ${configPath}.stylelintrc)" != "${configPath}.stylelintrc" ]; then
  echo "== making own config! =="
  echo "{
  \"extends\": \"stylelint-config-standard\",
  \"rules\": {
    \"indentation\": "$indentSpaces"
  }
}" > .stylelintrc
fi

echo "=================================="
echo "$(echo ${configPath}.stylelintrc)"
echo "${configPath}.stylelintrc"
echo "${stylelint_path}" >> $GITHUB_PATH
echo $pattern
echo "=================================="

sh -c "$stylelint_path $pattern"