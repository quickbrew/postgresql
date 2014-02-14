#!/bin/bash
set -e

# Configure the database to use our data dir.
sed -i -e"s/data_directory =.*$/data_directory = '\/data\/postgresql'/" /etc/postgresql/9.3/main/postgresql.conf

# Allow connections from anywhere.
sed -i -e"s/^#listen_addresses =.*$/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/9.3/main/pg_hba.conf
