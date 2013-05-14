
src_COFFEE		= $(shell find src -name '*.coffee')
test_COFFEE		= $(shell find test -name '*.coffee')
lib_JS			= $(patsubst src/%.coffee,lib/%.js,$(src_COFFEE))

all: $(lib_JS)

lib/%.js: src/%.coffee
	./node_modules/.bin/coffee --compile --output $(dir $@) $^

setup:
	npm install

test: all
	./node_modules/.bin/mocha --compilers coffee:coffee-script $(test_COFFEE)

.PHONY: all setup test
