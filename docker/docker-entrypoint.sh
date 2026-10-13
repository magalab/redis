#!/bin/sh
set -e

# Match the official Redis image behavior: allow both
#   redis-server --requirepass ...
# and
#   --requirepass ...
# when used after the image entrypoint.
case "${1:-}" in
  redis-server|redis-server.exe)
    ;;
  -*|'')
    set -- redis-server "$@"
    ;;
esac

exec "$@"
