# Backstage of [khosrow.io](https://khosrow.io)

There are multiple `make` targets which are useful for development:

- `prepare` : concatenate config files:
  - `config.common.toml`
  - `configs/config.en.toml`
  - `configs/config.fa.toml`
- `build` : prepare and build the hugo site
- `watch` : watch for any changes in the following and auto rebuild them:
  - `config.common.toml`
  - `configs/`
- `run` : prepare and build the site and run it locally, the site will be accessible on http://localhost:1313/
