#!/bin/sh
echo -ne '\033c\033]0;The Jarsio\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/The Jarsio.x86_64" "$@"
