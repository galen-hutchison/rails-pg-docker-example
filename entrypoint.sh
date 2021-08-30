#!/bin/sh
set -e

# This fixes a very specific bug where the rails server won't start if a certain .pid is found in the logs


# Prints the current environment
echo "Environment: $RAILS_ENV"

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
bundle exec "$@"