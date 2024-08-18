#!/bin/sh

if [ ! "$(docker network ls | grep postgres_network)" ]; then
  echo "Creating postgres network ..."
  docker network create postgres_network
else
  echo "Network postgres exists already ..."
fi
