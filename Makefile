.PHONY: all clean prepare build run watch

all: build

clean:
	rm -rf public

prepare:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

build: clean prepare
	./hugow --theme hugo-coder $(filter-out $@,$(MAKECMDGOALS))

run: prepare
	./hugow server --theme hugo-coder --disableFastRender --buildDrafts --buildFuture $(filter-out $@,$(MAKECMDGOALS))

watch:
	while true; do \
		inotifywait --recursive -e modify,create,delete \
			config.common.toml \
			configs \
		&& $(MAKE) prepare; \
	done

%:
	@:
