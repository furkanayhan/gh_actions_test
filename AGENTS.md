# AGENTS.md

## Project Overview

An example Ruby **CLI tool** demonstrating a GitHub Actions CI pipeline
(lint + test + build) at moderate complexity — instructive, but not
over-engineered.

Stack: Ruby (managed via mise), Bundler, RSpec (tests), RuboCop (lint),
Rake (build/tasks).

## Tooling / Versions (mise)

- `mise.toml` pins the Ruby version (and any other tools).
- Ruby version: **3.3.11**.
- Setup: `mise install`, then `bundle install`.
- Local and CI share the same version source (`mise.toml`) so they stay in sync.

## Intended Structure

```
.github/workflows/ci.yml   # lint + test + build jobs
mise.toml                  # ruby version + tools
bin/                       # CLI executable
lib/                       # CLI logic
spec/                      # RSpec tests (mirror lib/)
Gemfile                    # deps
Rakefile                   # build/test tasks
.rubocop.yml               # lint config
```

## Commands

- Setup tools: `mise install`
- Install deps: `bundle install`
- Run CLI: `bundle exec ruby bin/<cli>`
- Test: `bundle exec rspec`
- Lint: `bundle exec rubocop`
- Build / all: `bundle exec rake`

## CI Expectations

- Workflow `ci.yml` triggers on `push` and `pull_request`.
- Jobs: `lint` (rubocop), `test` (rspec), `build` (rake).
- Use `jdx/mise-action` to install the Ruby version from `mise.toml`, plus
  bundler caching.
- Keep it moderate: one workflow, a few jobs, no large matrix.

## GitHub (`gh` CLI)

Use the `gh` CLI to interact with GitHub instead of the web UI.

- Auth: `gh auth status` (login via `gh auth login` if needed).
- Watch CI runs: `gh run list`, `gh run watch`, `gh run view <id> --log`.
- Pull requests: `gh pr create`, `gh pr view`, `gh pr checks`.
- Repo: `gh repo view --web`.
- Prefer `gh` for inspecting workflow results and debugging CI failures.

## Conventions

- Idiomatic Ruby; follow RuboCop.
- Tests live in `spec/`, mirroring `lib/`.
- Exercise the CLI through specs.
- No code comments unless necessary.
- Small, focused commits.
- Never commit secrets.

## Notes for Agents

- Keep the example instructive, not over-engineered.
- Use mise for versions.
- Run lint + tests before finishing any change.
