#!/bin/bash

DVC_CACHE_PATH="/Users/quynhanhnd2402/UChicago/Fourth Quarter/MLOps/dvc_remote_cache"
# Initialization
dvc init
git commit -m "Initialize DVC"

# Add local remote storage
dvc remote add -d myremote "${DVC_CACHE_PATH}" || dvc remote modify myremote url "${DVC_CACHE_PATH}"

# Create git branch for first version
git checkout -b v1

# Add data to track in DVC
dvc add athletes.csv
# Commit to git
git add athletes.csv.dvc
git commit -m "Add data v1 to DVC tracking"

# Add to remote local dvc storage
dvc push

# Switch to git branch v2 and track data version 2
git checkout -b v2
dvc add athletes.csv
git add athletes.csv.dvc
dvc push


