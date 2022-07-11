SHELL := /usr/bin/env
.SHELLFLAGS := bash -c -e

.DEFAULT_GOAL := help

PYTHON_SCRIPTS = $(find . -type f -name "*.py")

.PHONY: clean_ipynb
clean_ipynb:
	find . \
	-type d -name .ipynb_checkpoints -delete

.PHONY: clean_pycache
clean_pycache:
	find . \
	-type f -name '*.py[co]' -delete \
	-o \
	-type d -name __pycache__ -delete

.PHONY: clean_pytest
clean_pytest:
	find . \
	-type d -name .pytest_cache -delete

## clean
##     delete all notebook checkpoints (clean_ipynb)
##     delete all pycache directories and other cache files (clean_pycache)
##     delete all pytest cache (clean_pytest)
.PHONY: clean
clean: clean_ipynb clean_pycache clean_pytest

.ONESHELL:
.PHONY: format_autoflake
format_autoflake:
	source virtual_environment/bin/activate
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
format_black:
	source virtual_environment/bin/activate
	black \
	--line-length 99 \
	--safe \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: format_isort
format_isort:
	source virtual_environment/bin/activate
	isort \
	--overwrite-in-place \
	--profile black \
	--atomic \
	--line-length 99 \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: format_pyupgrade
format_pyupgrade:
	source virtual_environment/bin/activate
	pyupgrade \
	$(PYTHON_SCRIPTS)

## format
##     change codes for older versions using pyupgrade (format_pyupgrade)
##     remove pyflake detected issues using autoflake (format_autoflake)
##     sort imports using isort (format_isort)
##     format code style using black (format_black)
.ONESHELL:
.PHONY: format
format: format_pyupgrade format_autoflake format_isort format_black
	source virtual_environment/bin/activate

## help: show top level goals
.PHONY: help
help: Makefile
	@sed -n 's/^## //p' $<

.ONESHELL:
.PHONY: lint_bandit
lint_bandit:
	source virtual_environment/bin/activate
	bandit \
	--recursive \
	--severity-level high \
	--confidence-level high \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_flake8
lint_flake8:
	source virtual_environment/bin/activate
	flake8 \
	--exclude __init__.py \
	--max-line-length 99 \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_pydocstyle
lint_pydocstyle:
	source virtual_environment/bin/activate
	pydocstyle \
	--convention numpy \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_pylint
lint_pylint:
	source virtual_environment/bin/activate
	pylint \
	--persistent no \
	--jobs 0 \
	--confidence HIGH \
	--enable all \
	--output-format colorized \
	--logging-format-style new \
	--allow-global-unused-variables no \
	--max-line-length 99 \
	--ignore-imports yes \
	$(PYTHON_SCRIPTS)

.ONESHELL:
.PHONY: lint_vulture
lint_vulture:
	source virtual_environment/bin/activate
	vulture \
	--min-confidence 100 \
	$(PYTHON_SCRIPTS)

.PHONY: lint
lint: lint_bandit lint_flake8 lint_pydocstyle lint_pylint lint_vulture

virtual_environment:
	python3 -m venv virtual_environment
	source virtual_environment/bin/activate
	python3 -m pip install --upgrade pip setuptools wheel
	python3 -m pip install -e .
