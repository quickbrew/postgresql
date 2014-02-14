postgresql
=========

Postgresql for docker

## Usage

First start a DATA container like [quickbrew/data](https://index.docker.io/u/quickbrew/data/).

    docker run -d -name postgresql -volumes-from DATA -p 5432:5432 quickbrew/postgresql
