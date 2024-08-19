#!/usr/bin/bash

lf() {
	export LF_CD_FILE=/var/tmp/.lfcd-$$
	command lf $@
	if [ -s "$LF_CD_FILE" ]; then
		local DIR="$(realpath "$(cat "$LF_CD_FILE")")"
		if [ "$DIR" != "$PWD" ]; then
			printf "\033[0;32mChanging current directory\n"
			cd "$DIR"
			printf "Now in $DIR\033[0m\n"
		fi
		rm "$LF_CD_FILE"
	fi
	unset LF_CD_FILE
}
