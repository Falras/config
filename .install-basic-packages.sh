#!/bin/bash

# installing node
if ! [[ -f "${HOME}/.nvm/nvm.sh" ]]; then 
 	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
 	nvm instal node
fi

if ! [[  "$(command -v tmux)" ]]; then 
	apt install tmux
fi

if ! [[  "$(command -v xclip)" ]]; then 
	apt install xclip
fi
