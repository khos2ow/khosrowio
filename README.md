# Backstage of [khosrow.io](https://khosrow.io)

There are multiple `make` targets which are useful for development:

- `prepare-ltr` : prepare LTR less file(s) (`resources/less/main.less`)
- `prepare-rtl` : prepare RTL less file(s) (`resources/less/main-rtl.less`)
- `prepare-js` : prepare javascript file(s) (`resources/js/main.js`)
- `prepare-conf` : concatinate config files:
  - `config.common.toml`
  - `configs/config.en.toml`
  - `configs/config.fa.toml`
- `prepare-theme` : prepare and build the theme (less and javascript file(s))
- `prepare` : execute all the above targets
- `build` : prepare and build the hugo site
- `watch` : watch for any changes in the following and auto rebuild them:
  - `config.common.toml`
  - `configs/`
  - `resources/`
  - `themes/coder/resources/`
- `run` : prepare and build the site and run it locally, the site will be accessible on http://localhost:1313/
