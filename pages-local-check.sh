#!/bin/bash

set -e

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
