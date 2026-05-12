#!/bin/bash

set -e

echo "## Converting ArtiCluster definition files to markdown files..."

dotnet tool exec -y ArtiCluster convert --overwrite articluster-files zensical/docs/assets/converted
echo "----------------------------------------------------------------------------"
echo "👍 Converted files -> zensical/docs/assets/converted"
echo "----------------------------------------------------------------------------"
echo ""

echo "## Generating markdown files for Zensical from converted data..."

pushd zensical-tools/markdown-gen
    uv sync
    uv run ./main.py
popd

echo "👍 Markdown generation completed: zensical-tools/markdown-gen -> zensical/docs/assets/converted"
echo ""

echo "## Starting local server for previewing the site..."

pushd zensical
    uvx zensical serve
popd
