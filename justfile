[default]
[doc("Show this help message")]
@help:
  just --unsorted --list

[doc("Install dependencies")]
setup:
  npm ci

[doc("Compile TypeScript")]
build:
  npm run compile

[doc("Watch mode (recompile on change)")]
watch:
  npm run watch

[doc("Package .vsix for distribution")]
package: build
  npx @vscode/vsce package

[doc("Full CI check (setup + build)")]
ci: setup build

[doc("Tag a release (alpha|beta|rc or omit for stable)")]
release *kind:
  #!/usr/bin/env bash
  set -euo pipefail
  current=$(jq -r .version package.json)
  IFS='.' read -r major minor patch <<< "${current%%-*}"
  if [[ -z "{{kind}}" ]]; then
    tag="v${major}.${minor}.${patch}"
  else
    prefix="v${major}.${minor}.${patch}-{{kind}}."
    last=$(git tag -l "${prefix}*" --sort=-version:refname | head -1)
    if [[ -n "$last" ]]; then
      n=$(( ${last##*.} + 1 ))
    else
      n=1
    fi
    tag="${prefix}${n}"
  fi
  echo "==> tagging ${tag}"
  git tag "$tag"
  git push origin "$tag"
  echo "==> ${tag} pushed"

[doc("Clean build artifacts")]
clean:
  rm -rf out *.vsix
