// SPDX-License-Identifier: MIT

import * as path from "path";
import { workspace, ExtensionContext } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;

export function activate(context: ExtensionContext): void {
  const config = workspace.getConfiguration("scampi.lsp");
  const command = config.get<string>("path", "scampls");
  const args = config.get<string[]>("args", []);

  const serverOptions: ServerOptions = {
    command,
    args,
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "scampi" }],
    synchronize: {
      fileEvents: workspace.createFileSystemWatcher("**/*.scampi"),
    },
  };

  client = new LanguageClient(
    "scampi",
    "scampi Language Server",
    serverOptions,
    clientOptions,
  );

  client.start();
}

export function deactivate(): Thenable<void> | undefined {
  return client?.stop();
}
