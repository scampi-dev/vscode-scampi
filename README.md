# scampi for Visual Studio Code

[![License](https://img.shields.io/badge/license-MIT-blue)](https://codeberg.org/scampi-dev/vscode-scampi/src/branch/main/LICENSE)

> [!NOTE]
> **scampi is developed on [Codeberg](https://codeberg.org/scampi-dev/vscode-scampi).**
> The GitHub repository is a read-only mirror — please file issues and pull requests on Codeberg. Account creation is free and the workflow is the same as GitHub.

Language support for [scampi](https://scampi.dev) configuration files.

## Install

Download the latest `.vsix` from
[Codeberg releases](https://codeberg.org/scampi-dev/vscode-scampi/releases)
or [GitHub releases](https://github.com/scampi-dev/vscode-scampi/releases),
then:

```bash
code --install-extension vscode-scampi-*.vsix
```

Or from within VS Code: `Ctrl+Shift+P` → **Extensions: Install from VSIX...**
→ select the downloaded file.

## Features

- **Syntax highlighting** for `.scampi` and `scampi.mod` files
- **LSP integration** via [scampls](https://scampi.dev/docs/lsp/) — real-time
  diagnostics, completion, hover documentation, and signature help

## Install scampls

The extension needs `scampls` on your PATH. Install options:

```bash
# One-liner (includes both scampi and scampls)
curl get.scampi.dev | sh

# Just the LSP server
curl get.scampi.dev/lsp | sh

# Via Go
go install scampi.dev/scampi/cmd/scampls@latest
```

## Extension settings

| Setting          | Default    | Description                     |
| ---------------- | ---------- | ------------------------------- |
| `scampi.lsp.path` | `scampls` | Path to the scampls binary      |
| `scampi.lsp.args` | `[]`      | Additional arguments to scampls |

For development against a local scampi checkout:

```json
{
  "scampi.lsp.path": "go",
  "scampi.lsp.args": ["run", "./cmd/scampls"]
}
```

## Development

```bash
npm install
npm run compile
```

To test: press F5 in VS Code to launch an Extension Development Host with the
extension loaded.

To package:

```bash
npm run package    # produces vscode-scampi-0.1.0.vsix
```

## License

MIT
