
src_COFFEE		= $(wildcard src/*.coffee)
lib_JS			= $(addprefix lib/,$(addsuffix .js,$(basename $(notdir $(src_COFFEE)))))

all: $(lib_JS)

lib/%.js: src/%.coffee
	./node_modules/.bin/coffee --compile --output lib $^

.PHONY: all
