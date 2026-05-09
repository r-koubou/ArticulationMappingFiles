#!/bin/bash

set -e

echo "## Converting ArtiCluster definition files to markdown files..."

dotnet tool exec -y ArtiCluster convert --overwrite articluster-files mkdocs/docs/assets/converted
echo "----------------------------------------------------------------------------"
echo "👍 Converted files -> mkdocs/docs/assets/converted"
echo "----------------------------------------------------------------------------"
echo ""

echo "## Generating markdown files for mkdocs from converted data..."

pushd mkdocs-tools/markdown-gen
    uv sync
    uv run ./main.py
popd

echo "👍 Markdown generation completed: mkdocs-tools/markdown-gen -> mkdocs/docs/assets/converted"
echo ""

echo "## Starting local server for previewing the site..."

pushd mkdocs
    uvx mkdocs serve
popd
