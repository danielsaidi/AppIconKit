#!/bin/bash

# Documentation:
# This script creates a new project version for the package.
# You can pass in a BRANCH to not use the default git branch.

NAME="AppIconKit"
DEFAULT_BRANCH="main"
BRANCH=${1:-$DEFAULT_BRANCH}
SCRIPT="scripts/version.sh"
chmod +x $SCRIPT
bash $SCRIPT $NAME $BRANCH
