#!/bin/bash

set -e

BASE_DIR="./"
TEMPLATE_BRANCH=$2
TEMPLATE_FILE=$3
COMMIT_MESSAGE="feat: add" $3
echo "📁 Fetching Repos: $BASE_DIR"

for repo_dir in "$BASE_DIR"/*; do
  if [ -d "$repo_dir/.git" ]; then
    echo "🔧 Getting into $repo_dir"
    cd "$repo_dir" || continue

    # Check unresolved
    git reset --hard
    git clean -fd

    # Checkout main y pull
    git checkout main && git pull origin main

    # Create branch
    git checkout -b "$TEMPLATE_BRANCH"

    # Create directory in case needed
    # mkdir -p "$(dirname "$TEMPLATE_FILE")"

    # Inject template
    cat << 'EOF' > "$TEMPLATE_FILE"

EOF

    # Local commit without pushing
    git add "$TEMPLATE_FILE"
    git commit -m "$COMMIT_MESSAGE" 

    echo "✅ $repo_dir updated '$TEMPLATE_BRANCH' (no push)"

    # Return to dir to continue next repo
    cd "$BASE_DIR"
  fi
done

echo "🎉 All repos procesados"
