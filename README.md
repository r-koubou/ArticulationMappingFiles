Articulation Mapping Files
==========================

This repository contains source definition files for articulation mappings for various DAWs.

Generated files are published on the project site:
https://r-koubou.github.io/ArticulationMappingFiles

## Download

You can browse and download individual files from the site above.

If you'd like to download everything as a single ZIP file, you can do so from the GitHub Releases page:
https://github.com/r-koubou/ArticulationMappingFiles/releases/latest

## About articluster-files

The files in articluster-files are source definitions written in the `Universal Definition` format used by [ArtiCluster](https://github.com/r-koubou/articluster), which I developed.

These source files are automatically converted by GitHub Actions into DAW-specific formats, and the generated files are then published on the project site.

## How to convert and preview the site in a local environment

### Requirements

- [.NET 10](https://dotnet.microsoft.com/)
- [uv](https://github.com/astral-sh/uv)

### Steps

1. run `pages-local-check.sh`
2. open `http://localhost:8080` in your web browser

### Converted files location

- `zensical/docs/assets/converted`

## Related Project

[ArtiCluster](https://github.com/r-koubou/articluster)
