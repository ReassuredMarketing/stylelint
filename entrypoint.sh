#!/bin/bash
set -e

pattern="./src/**/*.scss"

echo "=================================="
echo "Scanning ${pattern}"
echo "=================================="

npx stylelint #"${pattern}"