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

[doc("Clean build artifacts")]
clean:
  rm -rf out *.vsix
