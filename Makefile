
src_COFFEE		= $(wildcard src/*.coffee)
lib_JS			= $(addprefix lib/,$(addsuffix .js,$(basename $(notdir $(src_COFFEE)))))

all: $(lib_JS)

lib/%.js: src/%.coffee
	./node_modules/.bin/coffee --compile --output lib $^

test:
	./node_modules/.bin/mocha --compilers coffee:coffee-script test/*.coffee

.PHONY: all test
