if [[ $- != *i* ]] ; then
	return
fi


wineinstall() {
    filepath="${1?}"

    basename=$(basename "$filepath")

    wineprefix="${HOME?}/.wine/$basename"

    env WINEPREFIX="$wineprefix" wine "$filepath"
}

