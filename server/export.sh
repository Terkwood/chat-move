#!/bin/bash

GODOT_VERSION="3.2.3"

docker run -e EXPORT_NAME="Linux/X11" -e OUTPUT_FILENAME="chat_move_server" -v $(pwd):/build/src -v ./target:/build/output gamedrivendesign/godot-export:$GODOT_VERSION
