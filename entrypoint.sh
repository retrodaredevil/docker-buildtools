#!/usr/bin/env bash

set -e

if [ -n "$PUID" ]; then
  usermod --uid "$PUID" spigot >/dev/null
  # shellcheck disable=SC2153 # assume PGID is set because we have a default value for it in Dockerfile
  groupmod --gid "$PGID" spigot >/dev/null
  chown -R "$PUID:$PGID" /home/spigot
  cmd=$(printf '%q ' "$@")
  su spigot -l -c "$cmd"
else
  "$@"
fi

