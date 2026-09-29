#!/usr/bin/env bash
# Builds dist/chatprd-<version>.zip for upload to the OpenAI plugin submission portal.
set -euo pipefail
cd "$(dirname "$0")/.."
version=$(python3 -c "import json;print(json.load(open('plugin.json'))['version'])")
mkdir -p dist
out="dist/chatprd-${version}.zip"
rm -f "$out"
zip -qr "$out" plugin.json mcp.json skills assets README.md LICENSE
echo "$out"
