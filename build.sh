#!/bin/bash

export MIX_ENV=prod
export PORT=4750
export NODEBIN=`pwd`/assets/node_modules/.bin
export PATH="$PATH:$NODEBIN"

echo "Building..."

mkdir -p ~/.config

mix deps.get
(cd assets && yarn)
mix ecto.create
mix ecto.migrate
(cd assets && yarn deploy)
mix phx.digest
mix compile

echo "Generating release..."
mix release --env=prod
