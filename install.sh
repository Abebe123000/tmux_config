#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_CONFIG_DIR="${HOME}/.config/tmux"
TMUX_CONF="${TMUX_CONFIG_DIR}/tmux.conf"

# Create config directory if it doesn't exist
mkdir -p "${TMUX_CONFIG_DIR}"

# Backup existing tmux.conf if it exists
if [ -f "${TMUX_CONF}" ] && [ ! -L "${TMUX_CONF}" ]; then
    TIMESTAMP=$(date +%Y%m%d-%H%M%S%3N)
    BACKUP_FILE="${TMUX_CONF}.backup.${TIMESTAMP}"
    echo "Backing up existing tmux.conf to ${BACKUP_FILE}"
    mv "${TMUX_CONF}" "${BACKUP_FILE}"
fi

# Remove existing symlink if it exists
if [ -L "${TMUX_CONF}" ]; then
    echo "Removing existing symlink"
    rm "${TMUX_CONF}"
fi

# Create symlink
echo "Creating symlink: ${TMUX_CONF} -> ${SCRIPT_DIR}/tmux.conf"
ln -s "${SCRIPT_DIR}/tmux.conf" "${TMUX_CONF}"

echo "Installation complete!"
echo "Reload tmux config with: tmux source-file ~/.config/tmux/tmux.conf"
