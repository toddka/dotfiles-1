
#!/bin/sh

# TODO: auto-checkout dotfiles and run install.sh when connecting to 
# new instance
# TODO: add cache so install only runs once
#git clone git://github.com/toddka/dotfiles-1.git ~/dotfiles

# install thoughtbot rcm
case "$(uname -s)" in
   Darwin)
    brew install rcm
     ;;

   Linux)
     sudo wget -q https://apt.thoughtbot.com/thoughtbot.gpg.key -O /etc/apt/trusted.gpg.d/thoughtbot.gpg
     echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
     sudo apt-get update
     sudo apt-get install rcm
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'dotfile install failed: Windows not supported'
     ;;

   *)
     echo 'dotfile install failed: Unable to identify OS'
     ;;
esac

# install ohmyzsh deps. runs before rcup so that rcup can override ohmyzsh defaults
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

env RCRC=$HOME/dotfiles/rcrc rcup
