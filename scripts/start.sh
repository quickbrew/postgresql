#!/bin/bash
set -e

DATA_DIR=/data/postgresql

if [[ ! "$(ls -A $DATA_DIR)" ]]; then
  touch /firstrun
fi

if [[ -e /firstrun ]]; then
  source /scripts/first_run.sh
else
  source /scripts/normal_run.sh
fi

wait_for_postgres_and_run_post_start_action() {
  # Wait for postgres to finish starting up first.
  while [[ ! -e /run/postgresql/9.3-main.pid ]] ; do
    inotifywait -q -e create /run/postgresql/ >> /dev/null
  done

  post_start_action
}

pre_start_action

wait_for_postgres_and_run_post_start_action &

# Start PostgreSQL
echo "Starting PostgreSQL..."
su postgres -c '/usr/lib/postgresql/9.3/bin/postgres -D /etc/postgresql/9.3/main'
