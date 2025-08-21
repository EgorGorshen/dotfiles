#!/usr/bin/env sh

log() {
    local level="$1"
    shift
    local message="$*"
    case "$level" in
    fatal)
        echo "[FATAL] $message" >&2 
        exit 1
        ;;
    error)
        echo "[ERROR] $message" >&2 
        ;;
    warn|warning)
        echo "[WARN] $message" >&2  
        ;;
    info)
        echo "[INFO] $message" >&1  
        ;;
    debug)
        echo "[DEBUG] $message" >&1
        ;;
    *)
        echo "[UNKNOWN] $level $message" >&1
        ;;
    esac
}

get_script_path() {
    local script_path="${BASH_SOURCE[0]}"
    while [ -L "$script_path" ]; do
        local script_dir="$(cd -P "$(dirname "$script_path")" >/dev/null 2>&1 && pwd)"
        script_path="$(readlink "$script_path")"
        [[ $script_path != /* ]] && script_path="$script_dir/$script_path"
    done
    script_path="$(readlink -f "$script_path")"
    echo "$script_path"
}

get_script_dir() {
    local script_path
    script_path=$(get_script_path)
    local script_dir
    script_dir="$(cd -P "$(dirname "$script_path")" >/dev/null 2>&1 && pwd)"
    echo "$script_dir"
}


info() {
    log info "$*" 
}
fatal() {
	log fatal "$*"
}
error() {
	log error "$*"
}
warn() {
	log warn "$*"
}
debug() {
	log debug "$*"
}

SCRIPT_PATH=$(get_script_dir)
SCRIPTS_PATH=$SCRIPT_PATH/scripts

declare -a paths=()

if [[ $# -eq 0 ]]; then
    for file in $SCRIPTS_PATH/*; do
        if [[ -f $file ]]; then
            paths+=($file)
        fi
    done
else
    for script in $*; do
        path="$SCRIPTS_PATH/$script"
        if [[ -f "$path" ]]; then
            paths+=($path)
        else
            error "script does not exists : $path"
        fi
    done
fi


info "I think we need sudo"
sudo echo "[INFO] we get sudo"

if ! command -v paru >/dev/null 2>&1; then
    chmod +x $SCRIPTS_PATH/paru
    $SCRIPTS_PATH/paru
fi

for script in "${paths[@]}" ; do
    if [[ -f $script ]]; then 
        if [ ! -x $script ]; then
            warn "$script has no permitions to run"
            chmod +x $script
            info "add run permissions to script $script"
        fi
              
        info "start runing script $script"
        $script "$SCRIPT_PATH"

        if [[ $? -ne 0 ]]; then
            error "running $script"
        else
            info "DONE: $script" 
        fi
    else
        error "file $script does not exists"
    fi
done

