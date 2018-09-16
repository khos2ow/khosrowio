.PHONY: all prepare build run watch

all: build

prepare:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

build: prepare
	rm -rf public
	./hugow --theme hugo-coder $(filter-out $@,$(MAKECMDGOALS))

run: prepare
	./hugow server --theme hugo-coder --disableFastRender --buildDrafts $(filter-out $@,$(MAKECMDGOALS))

watch:
	while true; do \
		inotifywait --recursive -e modify,create,delete \
			config.common.toml \
			configs \
		&& $(MAKE) prepare; \
	done

%:
	@:
