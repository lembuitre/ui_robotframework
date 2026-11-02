# UI Test Automation Template (Robot Framework + Selenium)

A minimal starting point for automating web UI tests. It keeps the layered
structure of the original framework (pages -> actions -> tests) and drops
everything project-specific.

```
scenario/
  config/env.yaml      URL, credentials, browser, timeouts
  resources/           browser lifecycle + generic helpers (no feature knowledge)
  pages/               locators only, one file per screen
  actions/             keywords only, one file per screen, built on pages/ + resources/
  tests/               test suites, one file per feature, built on actions/
  data/                input files used by tests (uploads, fixtures)
run_tests.sh           local runner (tags, env overrides)
docker/Dockerfile      reproducible runtime with Chromium
.jenkins/Jenkinsfile   CI example
```

## Rules of the layers

| Layer     | Contains                        | May import                        |
|-----------|---------------------------------|-----------------------------------|
| pages     | `*** Variables ***` only        | nothing                           |
| resources | browser setup, generic helpers  | libraries only                    |
| actions   | keywords for one screen         | pages, resources, other actions   |
| tests     | test cases + suite setup        | actions, resources                |

Tests never use raw locators; actions never hard-code test data.

## Quick start

```bash
pip install -r requirements.txt
# edit scenario/config/env.yaml (URL, LOGIN_USER, ...)
./run_tests.sh --include smoke
```

Results land in `scenario/results/` (`log.html`, `report.html`).

## Adding a feature

1. `pages/<feature>_page.resource` - add locators. Use `<placeholder>` for
   dynamic parts and fill them with `Fill Locator`.
2. `actions/<feature>_actions.resource` - add keywords such as
   `Go To <Feature> Page`, `Create ...`, `... Should Exist`.
3. `tests/T00N_<feature>.robot` - import the actions, log in in
   `Suite Setup`, write cases that read like a checklist.
4. Tag cases (`smoke`, `regression`, ticket IDs) so CI can select them.

## Helpers worth knowing (resources/common.resource)

- `Wait And Click` / `Wait And Input` - wait, then act.
- `Click And Verify    ${click}    ${expect}` - retry a click until the
  expected element appears. Use this for anything flaky.
- `Fill Locator    ${template}    name    Alice` - build a locator from a
  template containing `<name>`.

## Configuration

Everything environment-specific lives in `config/env.yaml` (loaded by
`resources/browser.resource`) and can be overridden on the command line:

```bash
./run_tests.sh --variable URL:https://staging.example.com --variable HEADLESS:false
```

Failed tests are retried once via `--listener RetryFailed:1`; change the
number in `run_tests.sh`.
