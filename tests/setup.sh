
self="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"

function get_pil {
    PIL="$self/PIL-1.1.7.tar.gz"
    if [[ ! -f $PIL ]]; then
        pushd "$self"
        wget http://effbot.org/media/downloads/PIL-1.1.7.tar.gz
        popd
    fi
}

function get_pillow {
    PILLOW="$self/Pillow-2.5.1.zip"
    if [[ ! -f $PILLOW ]]; then
        pushd "$self"
        wget https://pypi.python.org/packages/source/P/Pillow/Pillow-2.5.1.zip
        popd
    fi
}

function clean_venv {
    VENV="$self/venv-$1"
    if [[ -d "$VENV" ]]; then
        rm -rf "$VENV"
    fi
    virtualenv "$VENV"
}

function error {
    echo ERROR: "$@"
    exit 1
}
