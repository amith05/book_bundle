#! /bin/bash -e

export PATH="$ORACLE_PATH:$PATH"

function run_sql()
{
  echo "executing ~ $2"
  echo "$2" | sqlplus "$1/$1@XE"
}

run_sql book_bundle "drop user book_bundle_test cascade;" || true
run_sql book_bundle "create user book_bundle_test identified by book_bundle_test default tablespace users temporary tablespace temp;"
run_sql book_bundle "grant dba to book_bundle_test;"
export RAILS_ENV=test
RAILS_ENV=test bundle install
RAILS_ENV=test bundle exec rake db:migrate

