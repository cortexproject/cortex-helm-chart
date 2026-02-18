#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-}"

current_version=$(grep '^version:' Chart.yaml | awk '{print $2}')
echo "Current version: $current_version"

if [ -n "$VERSION" ]; then
    new_version="$VERSION"
else
    unreleased_changes=$(awk '/^## master \/ unreleased/{flag=1; next} /^## /{flag=0} flag' CHANGELOG.md)
    echo "Unreleased changes analysis:"
    echo "$unreleased_changes"

    if echo "$unreleased_changes" | grep -q "\[CHANGE\]"; then
        echo "Found [CHANGE], applying major bump."
        bump="major"
    elif echo "$unreleased_changes" | grep -q "\[ENHANCEMENT\]"; then
        echo "Found [ENHANCEMENT], applying minor bump."
        bump="minor"
    else
        echo "Defaulting to patch bump ([BUGFIX], [DEPENDENCY], or other)."
        bump="patch"
    fi

    IFS='.' read -r -a parts <<< "$current_version"
    major="${parts[0]}"
    minor="${parts[1]}"
    patch="${parts[2]}"

    case "$bump" in
        major) major=$((major + 1)); minor=0; patch=0 ;;
        minor) minor=$((minor + 1)); patch=0 ;;
        patch) patch=$((patch + 1)) ;;
    esac
    new_version="$major.$minor.$patch"
fi

echo "New version: $new_version"

# Update Chart.yaml
# Using temp file for portability
sed "s/^version: .*/version: $new_version/" Chart.yaml > Chart.yaml.tmp && mv Chart.yaml.tmp Chart.yaml

# Update Changelog
date_str=$(date +%Y-%m-%d)
# Use perl for consistent behavior across platforms (macOS/Linux) regarding newlines in replacement
perl -i -pe "s/^## master \/ unreleased/## master \/ unreleased\n\n## $new_version \/ $date_str/" CHANGELOG.md

echo "Successfully bumped version to $new_version"
