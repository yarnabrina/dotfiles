# support
SUPPORTED_FORMATTERS=("autoflake" "black" "blacken-docs" "docformatter" "isort" "pyupgrade")
SUPPORTED_LINTERS=("bandit" "flake8" "interrogate" "pydocstyle" "pylint" "vulture")

# configuration
AUTOFLAKE_FLAGS=("--in-place" "--remove-all-unused-imports" "--expand-star-imports" "--ignore-init-module-imports" "--remove-duplicate-keys" "--remove-unused-variables")
BANDIT_FLAGS=("--severity-level" "high" "--confidence-level" "high")
BLACK_FLAGS=("--line-length" "99" "--safe")
BLACKEN_DOCS_FLAGS=("--line-length" "87")
DOCFORMATTER_FLAGS=("--in-place" "--wrap-summaries" "99" "--wrap-descriptions" "99")
FLAKE8_FLAGS=("--extend-ignore" "E203" "--per-file-ignores" "__init__.py:F401" "--max-line-length" "99")
INTERROGATE_FLAGS=("--fail-under" "80" "--ignore-init-method")
ISORT_FLAGS=("--overwrite-in-place" "--profile" "black" "--atomic" "--float-to-top" "--line-length" "99" "--remove-redundant-aliases")
PYDOCSTYLE_FLAGS=("--convention" "numpy")
PYLINT_FLAGS=("--enable-all-extensions" "--fail-under" "8.0" "--output-format" "colorized" "--enable" "all" "--include-naming-hint" "true" "--max-line-length" "99" "--logging-format-style" "new")
PYUPGRADE_FLAGS=("--keep-runtime-typing")
VULTURE_FLAGS=("--min-confidence" "100")

# format all python scripts in directory using available formatters (skipping nox/venv/virtualenv)
function format() {
    if [[ "${#}" -eq 0 ]]; then
        echo "Failure: no files or directories passed"
        return 1
    fi

    available_formatters=()
    for formatter in "${SUPPORTED_FORMATTERS[@]}"; do
        if [[ -x "$(command -v "${formatter}")" ]]; then
            available_formatters+=("${formatter}")
        else
            echo "Warning: ${formatter} missing"
        fi
    done

    if [[ "${#available_formatters[@]}" -eq 0 ]]; then
        echo "Failure: all supported formatters missing"
        return 1
    fi

    python_scripts=()
    for target in "${@}"; do
        if [[ -d "${target}" ]]; then
            python_scripts+=($(find "${target}" -type f -name "*.py" -not -path "*/.nox/*" -not -path "*/venv/*" -not -path "*/.virtualenv/*"))
        elif [[ -f "${target}" ]] && [[ "${target}" == *.py ]]; then
            python_scripts+=("${target}")
        else
            echo "Failure: only directory or python script is supported"
        fi
    done

    if [[ "${#python_scripts[@]}" -eq 0 ]]; then
        echo "Failure: no python scripts in directory"
        return 1
    fi

    if [[ " ${available_formatters[*]} " =~ " pyupgrade " ]]; then
        echo "Info: running pyupgrade"
        pyupgrade "${PYUPGRADE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_formatters[*]} " =~ " autoflake " ]]; then
        echo "Info: running autoflake"
        autoflake "${AUTOFLAKE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_formatters[*]} " =~ " isort " ]]; then
        echo "Info: running isort"
        isort "${ISORT_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_formatters[*]} " =~ " docformatter " ]]; then
        echo "Info: running docformatter"
        docformatter "${DOCFORMATTER_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_formatters[*]} " =~ " blacken-docs " ]]; then
        echo "Info: running blacken-docs"
        blacken-docs "${BLACKEN_DOCS_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_formatters[*]} " =~ " black " ]]; then
        echo "Info: running black"
        black "${BLACK_FLAGS[@]}" "${python_scripts[@]}"
    fi
}

# lint all python scripts in directory using available linters (skipping nox/venv/virtualenv)
function lint() {
    if [[ "${#}" -eq 0 ]]; then
        echo "Failure: no files or directories passed"
        return 1
    fi

    available_linters=()
    for linter in "${SUPPORTED_LINTERS[@]}"; do
        if [[ -x "$(command -v "${linter}")" ]]; then
            available_linters+=("${linter}")
        else
            echo "Warning: ${linter} missing"
        fi
    done

    if [[ "${#available_linters[@]}" -eq 0 ]]; then
        echo "Failure: all supported linters missing"
        return 1
    fi

    python_scripts=()
    for target in "${@}"; do
        if [[ -d "${target}" ]]; then
            python_scripts+=($(find "${target}" -type f -name "*.py" -not -path "*/.nox/*" -not -path "*/venv/*" -not -path "*/.virtualenv/*"))
        elif [[ -f "${target}" ]] && [[ "${target}" == *.py ]]; then
            python_scripts+=("${target}")
        else
            echo "Failure: only directory or python script is supported"
        fi
    done

    if [[ "${#python_scripts[@]}" -eq 0 ]]; then
        echo "Failure: no python scripts in directory"
        return 1
    fi

    if [[ " ${available_linters[*]} " =~ " bandit " ]]; then
        echo "Info: running bandit"
        bandit "${BANDIT_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_linters[*]} " =~ " flake8 " ]]; then
        echo "Info: running flake8"
        flake8 "${FLAKE8_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_linters[*]} " =~ " interrogate " ]]; then
        echo "Info: running interrogate"
        interrogate "${INTERROGATE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_linters[*]} " =~ " pydocstyle " ]]; then
        echo "Info: running pydocstyle"
        pydocstyle "${PYDOCSTYLE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_linters[*]} " =~ " pylint " ]]; then
        echo "Info: running pylint"
        pylint "${PYLINT_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_linters[*]} " =~ " vulture " ]]; then
        echo "Info: running vulture"
        vulture "${VULTURE_FLAGS[@]}" "${python_scripts[@]}"
    fi
}
