#!/bin/bash

HOME_DIR="$HOME"
DOCUMENTS_DIR="Documents"
BACKUP_NAME="backup_documents_$(date +%Y%m%d_%H%M%S).tar.gz"

EXCLUDE_DIRS=(
    "Documents/desenvolvimento/docker-compose"
    "**/.git"
    "**/.svn"
    "**/node_modules"
    "**/.m2"
    "**/target"
    "**/build"
    "**/__pycache__"
    "**/venv"
    "**/aws"
    "**/.aws"
    "**/.aws-sam"
    "**/aws-sam"
    "**/.angular"
)

EXCLUDE_FILES=(
    "*.log"
    "*.tmp"
    "*.swp"
)

EXCLUDE_PARAMS=()
for dir in "${EXCLUDE_DIRS[@]}"; do
    EXCLUDE_PARAMS+=(--exclude="$DOCUMENTS_DIR/$dir" --exclude="$DOCUMENTS_DIR/**/$dir")
done

for file in "${EXCLUDE_FILES[@]}"; do
    EXCLUDE_PARAMS+=(--exclude="$DOCUMENTS_DIR/$file")
done

echo "Iniciando backup da pasta Documents..."
tar -czvf "$BACKUP_NAME" "${EXCLUDE_PARAMS[@]}" -C "$HOME" "$DOCUMENTS_DIR"

echo "Backup concluído: $BACKUP_NAME"
