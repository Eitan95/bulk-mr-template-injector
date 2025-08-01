#!/bin/bash

set -e

BASE_DIR="./"
TEMPLATE_BRANCH=$2

echo "🚀 Pushing '$TEMPLATE_BRANCH' in repos inside: $BASE_DIR"

for repo_dir in "$BASE_DIR"/*; do
  if [ -d "$repo_dir/.git" ]; then
    echo "🔧 Working... $repo_dir"
    cd "$repo_dir" || continue

    # check if branch exists
    if git rev-parse --verify "$TEMPLATE_BRANCH" >/dev/null 2>&1; then
      git checkout "$TEMPLATE_BRANCH"
      git push origin "$TEMPLATE_BRANCH"
      echo "✅ Pushed $repo_dir"
    else
      echo "⚠️  Branch '$TEMPLATE_BRANCH' not created $repo_dir. Skipping..."
    fi

    cd "$BASE_DIR"
  fi
done

echo "🎉 Push completed. Repos updated with branch '$TEMPLATE_BRANCH'. Now continue with create PR and Merges"
