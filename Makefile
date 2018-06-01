LESS_DIR = ./static/less
LESS_TMP_FILE = tmp.less
CSS_DIR = ./static/css
CSS_FILE = style-all.min.css
CSS_TMP_FILE = tmp.css
current_dir = $(shell pwd)

.PHONY: clean build run

clean:
	rm -f $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

build: clean
	for f in "`find $(LESS_DIR) -maxdepth 1 -type f`"; do cat $$f >> $(LESS_DIR)/$(LESS_TMP_FILE); done
	lessc $(LESS_DIR)/$(LESS_TMP_FILE) > $(CSS_DIR)/$(CSS_TMP_FILE)
	uglifycss $(CSS_DIR)/$(CSS_TMP_FILE) > $(CSS_DIR)/$(CSS_FILE)
	rm -f $(CSS_DIR)/$(CSS_TMP_FILE)
	rm -f $(LESS_DIR)/$(LESS_TMP_FILE)

run: build
	./binaries/hugo server --buildDrafts
