#!/bin/bash
# ===========================================
# deploy.sh
#
# Deploy to production. This is a quick and
# dirty script that allows index.html to be 
# used in development and production. Arguably, 
# the deployment assets could use a good cleanup, 
# for example, jettisoning the node_modules
# directory, losing the src directory, and
# concatenating the various css files as
# a start.
#
# Usage:
# deploy.sh prodTopLevelDir
# where prodTopLevelDir is the top-level
# directory where index.html is to be deployed
# and where subdirectories contain assets.
# ===========================================

function usage() {
  echo "deploy.sh prodTopLevelDir"
  echo "where prodTopLevelDir is the top-level"
  echo "directory where index.html is to be deployed"
  echo "and where subdirectories contain assets."
}

# Sanity checks.
if [[ -z "$1" ]]
then
  usage
  exit 1
fi
if [[ -d "$1" ]]
then
  prodTopLevelDir=$1
else
  usage
  exit 1
fi
sourceDir=$(dirname $0)
if [[ "$sourceDir" = "$prodTopLevelDir" ]]
then
  echo "Please choose a different directory."
  usage
  exit 1
fi

# Make the required directory structure.
mkdir -p ${prodTopLevelDir}/build
mkdir -p ${prodTopLevelDir}/src/assets
mkdir -p ${prodTopLevelDir}/src/css/fonts
mkdir -p ${prodTopLevelDir}/node_modules/material-design-icons/iconfont/
mkdir -p ${prodTopLevelDir}/vendor/mdl-themes

# Copy files into place.
cp ${sourceDir}/build/main.js ${prodTopLevelDir}/build/
cp ${sourceDir}/src/assets/* ${prodTopLevelDir}/src/assets/
cp ${sourceDir}/src/css/fonts.css ${prodTopLevelDir}/src/css/
cp ${sourceDir}/src/css/main.css ${prodTopLevelDir}/src/css/
cp ${sourceDir}/src/css/fonts/* ${prodTopLevelDir}/src/css/fonts/
cp ${sourceDir}/vendor/mdl-themes/*.css ${prodTopLevelDir}/vendor/mdl-themes/
cp ${sourceDir}/node_modules/material-design-icons/iconfont/* ${prodTopLevelDir}/node_modules/material-design-icons/iconfont/
cp ${sourceDir}/index.html ${prodTopLevelDir}/
