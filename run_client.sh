#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd -P)"
JRE_DIR="$SCRIPT_DIR/jre"
GAME_DIR="$SCRIPT_DIR/game"
CLIENT_JAR="$GAME_DIR/client.jar"

if [ ! -x "$JRE_DIR/bin/java" ]; then
    echo "ERROR: Bundled JRE not found:"
    echo "$JRE_DIR/bin/java"
    echo
    read -r -p "Press Enter to exit..."
    exit 1
fi

if [ ! -f "$CLIENT_JAR" ]; then
    echo "ERROR: client.jar not found:"
    echo "$CLIENT_JAR"
    echo
    read -r -p "Press Enter to exit..."
    exit 1
fi

cd "$GAME_DIR" || exit 1

exec "$JRE_DIR/bin/java" -jar "client.jar"