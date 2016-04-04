#!/bin/bash

if [ ! -f ./data/development.sqlite3 ]; then
  bundle exec rake db:create
  bundle exec rake db:migrate
fi

bundle exec rails s -b 0.0.0.0
