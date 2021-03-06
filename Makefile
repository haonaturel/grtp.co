# `make` or `make all` will just pass through to grunt.
# The default behavior for grunt is equivalent to `grunt test && grunt build`.
all: node_modules
	./node_modules/.bin/grunt

run: node_modules
	./node_modules/.bin/grunt connect:server:keepalive

build: node_modules
	./node_modules/.bin/grunt build

test: jstest

tests: jstest

node_modules: package.json
	npm install
	@if [ -d node_modules ]; then touch node_modules; fi

jstest: node_modules
	./node_modules/.bin/grunt test

clean:
	rm -rf node_modules
