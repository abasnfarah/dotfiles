
echo "Starting bootstrapping.."
sleep .5
echo "..."
sleep .5

command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Check for Homebrew, install if we don't have it
if ! command_exists brew; then
    echo "Installing homebrew..."
    sleep .5
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

#Updating Brew
brew update

brew install bash zsh


