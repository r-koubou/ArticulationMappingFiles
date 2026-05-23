#!/bin/bash

set -e

echo "## Cleaning up old converted files and generated markdown files..."

rm -fr zensical/docs/assets/converted
rm -fr zensical/docs/Cakewalk/*/
rm -fr zensical/docs/Cubase/*/
rm -fr zensical/docs/Logic/*/
rm -fr zensical/docs/StudioOne/*/
rm -fr zensical/site

echo "----------------------------------------------------------------------------"
echo "👍 Cleaned up old converted files and generated markdown files"
echo "----------------------------------------------------------------------------"

echo "## Converting ArtiCluster definition files and generating markdown files..."

dotnet tool exec -y ArtiCluster \
    convert \
    --overwrite \
    --output-markdown-list-dir zensical/docs \
    articluster-files \
    zensical/docs/assets/converted

echo "----------------------------------------------------------------------------"
echo "👍 Converted files -> zensical/docs/assets/converted"
echo "👍 Generated Markdown files -> zensical/docs"
echo "----------------------------------------------------------------------------"
echo ""

echo "## Starting local server for previewing the site..."

pushd zensical
    uvx zensical serve
popd
