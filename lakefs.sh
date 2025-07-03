#!/bin/bash

# Launch lakefs

docker run --name lakefs --pull always --rm --publish 8000:8000 treeverse/lakefs:latest run --quickstart

# Create repository and branches for versions
lakectl repo create lakefs://athletes "local:///Users/quynhanhnd2402/UChicago/Fourth Quarter/MLOps/mlops-data-versioning"
lakectl branch create lakefs://athletes/v1 --source lakefs://athletes/main
lakectl branch create lakefs://athletes/v2 --source lakefs://athletes/main

# Upload datasets
lakectl fs upload lakefs://athletes/v1/athletes_v1.csv --source ./athletes.csv
lakectl commit lakefs://athletes/v1 --message "Dataset v1"

# Using the new data on the v2 GitHub branch
lakectl fs upload lakefs://athletes/v2/athletes_v2.csv --source ./athletes.csv
lakectl commit lakefs://athletes/v2 --message "Dataset v2"