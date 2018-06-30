# LESS params
LESS_DIR = ./static/less
LESS_FILE = main.less
LESS_RTL_FILE = main-rtl.less

# CSS params
CSS_DIR = ./static/css
CSS_FILE = main.min.css
CSS_RTL_FILE = main-rtl.min.css
CSS_TMP_FILE = tmp.css

.PHONY: clean build build build-ltr build-rtl build-conf run

clean:
	rm -f $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_RTL_FILE)

define build_less
	lessc $(LESS_DIR)/$(1) > $(CSS_DIR)/$(CSS_TMP_FILE)
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(2)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
endef

build: clean build-ltr build-rtl build-conf

build-ltr:
	$(call build_less,$(LESS_FILE),$(CSS_FILE))

build-rtl:
	$(call build_less,$(LESS_RTL_FILE),$(CSS_RTL_FILE))

build-conf:
	cat config.common.toml configs/config.en.toml configs/config.fa.toml > config.toml

run: build
	./binaries/hugo server --theme coder --buildDrafts
