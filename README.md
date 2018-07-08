# Back stage of [khosrow.io](https://khosrow.io)

There are multiple `make` targets which are useful for development:

- `build-ltr` : build LTR less file(s) (`static/less/main.less`)
- `build-rtl` : build RTL less file(s) (`static/less/main-rtl.less`)
- `build-js` : build javascript file(s) (`static/js/main.js`)
- `build-conf` : concatinate config files:
  - `config.common.toml`
  - `configs/config.en.toml`
  - `configs/config.fa.toml`
- `build` : execute all the above targets.
- `watch` : watch for any changes in the following and auto rebuild them:
  - `static/less/`
  - `static/js/main.js`
  - `config.common.toml`
  - `configs/`
- `run` : build the site and run it locally, the site will be accessible on http://localhost:1313/.
