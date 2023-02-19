# support
SUPPORTED_TOOLS=("autoflake" "black" "docformatter" "isort" "pyupgrade")

# configuration
AUTOFLAKE_FLAGS=("--in-place" "--remove-all-unused-imports" "--expand-star-imports" "--ignore-init-module-imports" "--remove-duplicate-keys" "--remove-unused-variables")
BLACK_FLAGS=("--line-length" "99" "--safe")
DOCFORMATTER_FLAGS=("--in-place" "--wrap-summaries" "99" "--wrap-descriptions" "99")
ISORT_FLAGS=("--overwrite-in-place" "--profile" "black" "--atomic" "--float-to-top" "--line-length" "99" "--remove-redundant-aliases")
PYUPGRADE_FLAGS=("--keep-runtime-typing")

# format all python scripts in directory using available tools (skipping nox/venv/virtualenv)
function format() {
    if [[ "${#}" -eq 0 ]]; then
        echo "Failure: no files or directories passed"
        return 1
    fi

    available_tools=()
    for tool in "${SUPPORTED_TOOLS[@]}"; do
        if [[ -x "$(command -v "${tool}")" ]]; then
            available_tools+=("${tool}")
        else
            echo "Warning: ${tool} missing"
        fi
    done

    if [[ "${#available_tools[@]}" -eq 0 ]]; then
        echo "Failure: all supported tools missing"
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

    if [[ " ${available_tools[*]} " =~ " pyupgrade " ]]; then
        echo "Info: applying pyupgrade"
        pyupgrade "${PYUPGRADE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_tools[*]} " =~ " autoflake " ]]; then
        echo "Info: applying autoflake"
        autoflake "${AUTOFLAKE_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_tools[*]} " =~ " isort " ]]; then
        echo "Info: applying isort"
        isort "${ISORT_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_tools[*]} " =~ " docformatter " ]]; then
        echo "Info: applying docformatter"
        docformatter "${DOCFORMATTER_FLAGS[@]}" "${python_scripts[@]}"
    fi

    if [[ " ${available_tools[*]} " =~ " black " ]]; then
        echo "Info: applying black"
        black "${BLACK_FLAGS[@]}" "${python_scripts[@]}"
    fi
}
