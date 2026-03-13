#!/usr/bin/env bash
set -euo pipefail

# Liste der gewünschten PHP-Versionen
PHP_VERSIONS=("8.1" "8.2" "8.3" "8.4" "8.5")

echo "📦 Starte Download der PHP-FPM Images..."

for version in "${PHP_VERSIONS[@]}"; do
    image="php:${version}-fpm"

    if docker image inspect "$image" >/dev/null 2>&1; then
        echo "$image ist bereits lokal vorhanden."
    else
        echo "Lade $image herunter..."
        docker pull "$image"
    fi
done

echo "Fertig! Alle PHP-Versionen sind lokal verfügbar."
