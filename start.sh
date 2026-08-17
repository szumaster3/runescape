#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" >/dev/null 2>&1 && pwd -P)"
JRE_DIR="$SCRIPT_DIR/jre"
GAME_DIR="$SCRIPT_DIR/game"
SERVER_JAR="$GAME_DIR/server.jar"

echo "========================================"
echo "         2009scape Server"
echo "========================================"
echo

if [ ! -x "$JRE_DIR/bin/java" ]; then
    echo "ERROR: Bundled JRE not found:"
    echo "$JRE_DIR/bin/java"
    echo
    read -r -p "Press Enter to exit..."
    exit 1
fi

if [ ! -f "$SERVER_JAR" ]; then
    echo "ERROR: server.jar not found:"
    echo "$SERVER_JAR"
    echo
    read -r -p "Press Enter to exit..."
    exit 1
fi

if [ ! -f "$GAME_DIR/worldprops/default.conf" ]; then
    echo "ERROR: worldprops/default.conf not found:"
    echo "$GAME_DIR/worldprops/default.conf"
    echo
    read -r -p "Press Enter to exit..."
    exit 1
fi

cd "$GAME_DIR" || exit 1

echo "Starting server..."
echo "Working directory:"
pwd
echo
echo "========================================"
echo

"$JRE_DIR/bin/java" -jar "server.jar"

EXIT_CODE=$?

echo
echo "========================================"
echo "Server stopped."
echo "Exit code: $EXIT_CODE"
echo "========================================"
echo

read -r -p "Press Enter to exit..."
exit "$EXIT_CODE"