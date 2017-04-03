if [[ $- != *i* ]] ; then
	return
fi


# scale touchpad sensitivity in sdl when low-res fullscreen
export SDL_MOUSE_RELATIVE=0


wineinstall() {
    filepath="${1?}"

    basename=$(basename "$filepath")

    wineprefix="${HOME?}/.wine/$basename"

    env WINEPREFIX="$wineprefix" wine "$filepath"
}

