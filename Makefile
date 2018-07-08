# LESS params
LESS_DIR = ./static/less
LESS_FILE = main.less
LESS_RTL_FILE = main-rtl.less

# CSS params
CSS_DIR = ./static/css
CSS_FILE = main.min.css
CSS_RTL_FILE = main-rtl.min.css
CSS_TMP_FILE = tmp.css

# JS params
JS_DIR = ./static/js
JS_SRC_FILE = main.js
JS_MIN_FILE = main.min.js

.PHONY: clean build build build-ltr build-rtl build-js build-conf run

clean:
	rm -f $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_RTL_FILE)
	rm -f $(JS_DIR)/$(JS_MIN_FILE)

define build_less
	lessc $(LESS_DIR)/$(1) > $(CSS_DIR)/$(CSS_TMP_FILE)
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(2)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
endef

build: clean build-ltr build-rtl build-js build-conf
	cd themes/coder && $(MAKE) build

build-ltr:
	$(call build_less,$(LESS_FILE),$(CSS_FILE))

build-rtl:
	$(call build_less,$(LESS_RTL_FILE),$(CSS_RTL_FILE))

build-js:
	uglifyjs $(JS_DIR)/$(JS_SRC_FILE) > $(JS_DIR)/$(JS_MIN_FILE)

build-conf:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

watch:
	while true; do \
		inotifywait -e modify,create,delete \
			$(LESS_DIR) \
			$(JS_DIR)/$(JS_SRC_FILE) \
			config.common.toml \
			./configs \
		&& $(MAKE) build; \
	done

run: build
	./binaries/hugo server --theme coder --buildDrafts
