#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

VERSIONS=(8.1 8.2 8.3 8.4 8.5)
PUID=${PUID:-1000}
PGID=${PGID:-1000}

for VERSION in "${VERSIONS[@]}"; do
  echo "==> Building boxy-php:${VERSION} ..."
  docker build \
    --build-arg PHP_VERSION="${VERSION}" \
    --build-arg PUID="${PUID}" \
    --build-arg PGID="${PGID}" \
    -t "boxy-php:${VERSION}" \
    "${PROJECT_ROOT}/containers/php"
done

echo "Done. Switch versions by changing PHP_VERSION in .env and running: docker compose up -d"
