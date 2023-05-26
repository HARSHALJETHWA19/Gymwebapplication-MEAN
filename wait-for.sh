#!/bin/bash

set -e

host="$1"
port="$2"

>&2 echo "Waiting for $host:$port to be available..."

while ! nc -z "$host" "$port"; do
    sleep 1
done

>&2 echo "$host:$port is available"
