if [[ $- != *i* ]] ; then
	return
fi


export LD_LIBRARY_PATH="${HOME?}/.local/lib32/:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${HOME?}/.local/lib64/:${LD_LIBRARY_PATH}"
export MANPATH="${HOME?}/.local/share/man/:${MANPATH}"
export PATH="${HOME?}/.local/bin/:$PATH"


export SDL_MOUSE_RELATIVE=0


wineinstall() {
    filepath="${1?}"

    basename=$(basename "$filepath")

    wineprefix="${HOME?}/.wine/$basename"

    env WINEPREFIX="$wineprefix" wine "$filepath"
}

