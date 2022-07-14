MAKEFLAGS += --silent

SHELL := /usr/bin/env
.SHELLFLAGS := bash -c -e

.DEFAULT_GOAL := help

PYTHON_SCRIPTS := $(shell find . -type f -name "*.py")

.PHONY: clean_ipynb
clean_ipynb:
	find . \
	-type d -name .ipynb_checkpoints \
	-exec rm -r "{}" +

.PHONY: clean_pycache
clean_pycache:
	find . \
	-type f -name '*.py[co]' -delete \
	-o \
	-type d -name __pycache__ -delete

.PHONY: clean_pytest
clean_pytest:
	find . \
	-type d -name .pytest_cache \
	-exec rm -r "{}" +

## clean
##     delete all notebook checkpoints (clean_ipynb)
##     delete all pycache directories and other cache files (clean_pycache)
##     delete all pytest cache (clean_pytest)
.PHONY: clean
clean: clean_ipynb clean_pycache clean_pytest

.ONESHELL:
.PHONY: format_autoflake
format_autoflake: virtualenv
	source virtualenv/bin/activate
	autoflake \
	--in-place \
	--expand-star-imports \
	--remove-all-unused-imports \
	--ignore-init-module-imports \
	--remove-duplicate-keys \
	--remove-unused-variables \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: format_black
format_black: virtualenv
	source virtualenv/bin/activate
	black \
	--line-length 99 \
	--safe \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: format_isort
format_isort: virtualenv
	source virtualenv/bin/activate
	isort \
	--overwrite-in-place \
	--profile black \
	--atomic \
	--line-length 99 \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: format_pyupgrade
format_pyupgrade: virtualenv
	source virtualenv/bin/activate
	pyupgrade \
	--py39-plus \
	$(PYTHON_SCRIPTS)

## format
##     change codes for older versions using pyupgrade (format_pyupgrade)
##     remove pyflake detected issues using autoflake (format_autoflake)
##     sort imports using isort (format_isort)
##     format code style using black (format_black)
.ONESHELL:
.PHONY: format
format: format_pyupgrade format_autoflake format_isort format_black

.PHONY: help
help: Makefile
	@sed -n 's/^## //p' $<

.ONESHELL:
.PHONY: lint_bandit
lint_bandit: virtualenv
	source virtualenv/bin/activate
	bandit \
	--severity-level high \
	--confidence-level high \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_flake8
lint_flake8: virtualenv
	source virtualenv/bin/activate
	flake8 \
	--exclude __init__.py \
	--max-line-length 99 \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_pydocstyle
lint_pydocstyle: virtualenv
	source virtualenv/bin/activate
	pydocstyle \
	--convention numpy \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_pylint
lint_pylint: virtualenv
	source virtualenv/bin/activate
	pylint \
	--persistent n \
	--suggestion-mode y \
	--output-format colorized \
	--reports y \
	--confidence HIGH \
	--enable all \
	--logging-format-style new \
	--init-import n \
	--allow-global-unused-variables no \
	--max-line-length 99 \
	--ignore-comments yes \
	--ignore-docstrings yes \
	--ignore-imports yes \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_vulture
lint_vulture: virtualenv
	source virtualenv/bin/activate
	vulture \
	--min-confidence 100 \
	$(PYTHON_SCRIPTS)

## lint
##     find security issues using bandit (lint_bandit)
##     lint all python scipts using flake8 (lint_flake8)
##     check docstring presence and formats using pydocstyle (lint_pydocstyle)
##     lint all python scipts using pylint (lint_pylint)
##     find dead code using vulture (lint_vulture)
.PHONY: lint
lint: lint_bandit lint_flake8 lint_pydocstyle lint_pylint lint_vulture

## virtualenv
##     create isolated environment
##     install up-to-date dependencies
##     install root package as editable
.ONESHELL:
virtualenv:
	python3 -m venv virtualenv
	echo "*" > virtualenv/.gitignore
	source virtualenv/bin/activate
	python3 -m pip install --upgrade pip setuptools wheel
	python3 -m pip install --upgrade --editable .
