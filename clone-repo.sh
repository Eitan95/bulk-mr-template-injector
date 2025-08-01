#!/bin/bash

# Filepath to clone
BASE_DIR="./"
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

REPOS=(

)

# Clone all repos listed in REPOS
for repo in "${REPOS[@]}"; do
  name=$(basename "$repo")
  if [ -d "$name" ]; then
    echo "📁 Repo '$name' duplicated or already exist, skipping..."
  else
    echo "⬇️  Cloning $repo"
    git clone "$repo"
  fi
done

echo "✅ Repositories cloned"
