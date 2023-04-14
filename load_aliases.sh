#!/bin/bash

# Exit script if not running on Linux
if [[ ! "$OSTYPE" =~ ^linux  ]] && [[ ! "$OSTYPE" == "darwin"* ]]; then
    echo "Your OS is not supported."
	echo "Finishing..."
	exit 0
fi

# Copy aliases to hidden file in user home directory if allowed
if test /home/$USER/.myaliases; then  
	echo "The file already exists. Do you want to override? [y/N]" 
	read over
	if [[ ${over^} != "Y" ]]; then
		echo "Finishing... "
		exit 0
	fi
fi

cp ./myaliases.txt /home/$USER/.myaliases
echo "The file copied to /home/$USER/.myaliases"

# Choose your shell
echo "Choose your shell[1-3]:
1) bash
2) zsh
3) other"
read shell

# Declare path to shell config or exit
case $shell in
	1) path="/home/$USER/.bashrc" ;;
	2) path="/home/$USER/.zshrc" ;;
	3) echo -e "Not supported\nFinishing..." && exit 0 ;;
esac

# Add ref to aliases in shell config if not exists already
echo "Adding reference to $path"
grep -q "/home/$USER/.myaliases 2>/dev/null" ~/.bashrc || echo -e "# MY ALIASES\nsource /home/$USER/.myaliases 2>/dev/null" >> $path
echo "DONE!!"

# Reload your shell
source $path
test $SHELL != "" && exec $SHELL || echo -e "Please reload your shell or execute following command manually: \"source $path\""
