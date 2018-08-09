#!/bin/bash
set -e

for EXTENSTION in $(cat vscode-extensions.list); do
  code --install-extension "${EXTENSTION}"
done

