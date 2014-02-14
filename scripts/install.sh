#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

apt-get update

# Install postgres
apt-get install -y --force-yes postgresql-9.3
/etc/init.d/postgresql stop

# Install other tools
apt-get install -y pwgen inotify-tools
