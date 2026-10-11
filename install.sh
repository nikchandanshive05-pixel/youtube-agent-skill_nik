#!/usr/bin/env bash
# install.sh - Install YouTube Agent skills for Google Antigravity on macOS/Linux
set -euo pipefail

echo -e "\033[0;36mInstalling YouTube Agent skills for Google Antigravity...\033[0m"

PLUGIN_DIR="${HOME}/.gemini/config/plugins/youtube-agent"
VOICE_DIR="${HOME}/.gemini/youtube"
VOICE_FILE="${VOICE_DIR}/voice.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Create plugin directory
mkdir -p "${PLUGIN_DIR}"

# 2. Copy plugin assets
cp -f "${SCRIPT_DIR}/plugin.json" "${PLUGIN_DIR}/"
cp -f "${SCRIPT_DIR}/README.md" "${PLUGIN_DIR}/"
cp -f "${SCRIPT_DIR}/LICENSE" "${PLUGIN_DIR}/"
cp -rf "${SCRIPT_DIR}/skills" "${PLUGIN_DIR}/"
cp -rf "${SCRIPT_DIR}/templates" "${PLUGIN_DIR}/"
if [ -d "${SCRIPT_DIR}/rules" ]; then
    cp -rf "${SCRIPT_DIR}/rules" "${PLUGIN_DIR}/"
fi

echo -e "\033[0;32mPlugin installed to: ${PLUGIN_DIR}\033[0m"

# 3. Setup voice profile template if not present
mkdir -p "${VOICE_DIR}"
if [ ! -f "${VOICE_FILE}" ]; then
    cp "${SCRIPT_DIR}/templates/voice.md" "${VOICE_FILE}"
    echo -e "\033[0;33mCreated initial voice profile at: ${VOICE_FILE}\033[0m"
else
    echo -e "\033[0;37mFound existing voice profile at: ${VOICE_FILE}\033[0m"
fi

echo ""
echo -e "\033[0;36mInstallation complete! Restart Antigravity to activate the plugin.\033[0m"
echo -e "Available skills: /yt-script, /yt-package, /yt-edit, /yt-retention, /yt-shorts, /yt-viral, /yt-plan, /yt-seo, /yt-chapters, /yt-comment, /yt-audit"
