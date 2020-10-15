#!/bin/bash
set -e

pattern="./src/**/*.scss"

echo "=================================="
echo "Scanning ${pattern}"
pwd
echo "=================================="



npx stylelint "${pattern}"