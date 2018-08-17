# Temp build directory
TMP_DIR = /tmp
TMP_CSS_FILE = tmp.css

# LESS params
LESS_DIR = ./resources/less
LESS_LTR_FILE = main.less
LESS_RTL_FILE = main-rtl.less

# CSS params
CSS_DIR = ./static/css
CSS_LTR_FILE = main.min.css
CSS_RTL_FILE = main-rtl.min.css

# JS params
JS_SRC_DIR = ./resources/js
JS_SRC_FILE = main.js
JS_MIN_DIR = ./static/js
JS_MIN_FILE = main.min.js

.PHONY: prepare prepare-ltr prepare-rtl prepare-js prepare-conf prepare-theme build run watch

define build_less
	lessc $(LESS_DIR)/$(1) > $(TMP_DIR)/$(TMP_CSS_FILE)
	uglifycss $(TMP_DIR)/$(TMP_CSS_FILE) > $(CSS_DIR)/$(2)
	rm -f $(TMP_DIR)/$(TMP_CSS_FILE)
endef

prepare: prepare-theme prepare-ltr prepare-rtl prepare-js prepare-conf

prepare-ltr:
	$(call build_less,$(LESS_LTR_FILE),$(CSS_LTR_FILE))

prepare-rtl:
	$(call build_less,$(LESS_RTL_FILE),$(CSS_RTL_FILE))

prepare-js:
	uglifyjs $(JS_SRC_DIR)/$(JS_SRC_FILE) > $(JS_MIN_DIR)/$(JS_MIN_FILE)

prepare-conf:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

prepare-theme:
	cd themes/coder && $(MAKE) prepare

build: prepare
	rm -rf public
	./hugow --theme coder $(filter-out $@,$(MAKECMDGOALS))

run: prepare
	./hugow server --theme coder --disableFastRender --buildDrafts $(filter-out $@,$(MAKECMDGOALS))

watch:
	while true; do \
		inotifywait --recursive -e modify,create,delete \
			config.common.toml \
			configs \
			resources \
			themes/coder/resources \
		&& $(MAKE) prepare; \
	done

%:
	@:
