#!/usr/bin/env bash
# since #!/bin/bash will always set to bash since running  in bash

IMAGE_NAME="42-valgrind-starter-pack"
ALIAS_NAME="valgrind-docker"

echo "[+] building docker image ଘ(∩^o^)⊃━☆゜"
echo
docker build -t $IMAGE_NAME -f Dockerfile .

if [[ -n $ZSH_VERSION ]]; then
	SHELL_RC="$HOME/.zshrc"
elif [[ -n $BASH_VERSION ]]; then
	SHELL_RC="$HOME/.bashrc"
else
	SHELL_RC="$HOME/.profile"
fi

echo "[+] adding alias ଘ( ･ω･)_/ﾟ･:*:･｡☆ '$ALIAS_NAME' to $SHELL_RC"
echo
echo "alias $ALIAS_NAME='docker run -it --rm -v \$(pwd):/app $IMAGE_NAME'" >> "$SHELL_RC"
echo
echo "[+] done ଘ(˵╹-╹)━☆•.,.•*¯•.,,.•* restart terminal or run 'source $SHELL_RC' to use the alias"

# even simpler version of this whole script would be:

# docker build -t 42-valgrind-starter-pack .
# alias valgrind-docker='docker run -it --rm -v \$(pwd):/app 42-valgrind-starter-pack