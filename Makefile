.PHONY: all
all: build

.PHONY: clean
clean:
	rm -rf public

.PHONY: prepare
prepare:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

.PHONY: build
build: clean prepare
	./hugow --theme hugo-coder $(filter-out $@,$(MAKECMDGOALS))

.PHONY: run
run: prepare
	./hugow server --theme hugo-coder --disableFastRender --buildDrafts --buildFuture $(filter-out $@,$(MAKECMDGOALS))

.PHONY: watch
watch:
	while true; do \
		inotifywait --recursive -e modify,create,delete \
			config.common.toml \
			configs \
		&& $(MAKE) prepare; \
	done

%:
	@:
