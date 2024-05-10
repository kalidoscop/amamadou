SHELL := /bin/bash

# retreive the current git branch
GIT_CURRENT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

clean:
	@rm -fr venv/
	@rm -fr dist/
	@rm -fr htmlcov/
	@rm -fr site/
	@rm -fr .eggs/
	@rm -fr .tox/
	@find . -name '*.egg-info' -exec rm -fr {} +
	@find . -name '*.egg' -exec rm -f {} +
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -fr {} +

venv: clean
	virtualenv --python python3 venv

install:
	venv/bin/pip install -r requirements.txt

test:
	venv/bin/pytest -x --color=yes

test-url:
	curl localhost:5000 