#!/bin/bash
# If running the rails server then create or migrate existing database
if [ "${*}" == "./bin/rails server -b 0.0.0.0" ]; then
  ./bin/rails db:create
  ./bin/rails db:prepare
fi

exec "${@}"