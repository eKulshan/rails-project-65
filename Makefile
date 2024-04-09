start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup: prepare-env-file install db-prepare

debug:
	bundle exec rdbg --open -n -c -- bundle exec rails s

prepare-env-file:
	cp .env.example .env

install:
	bin/setup

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

check: test lint

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: test