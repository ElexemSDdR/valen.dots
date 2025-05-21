# My config


## Package Manager

[Homebrew](https://brew.sh) is a package manager for Linux and MacOS fast and easy to use. It can install packages that linux could not have.
```bash
# Install Homebrew via curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Shells

Here could be 3 shells: **zsh**, **Nushell** or **Fish**. Currently I use a lot **Fish**.
#### To install zsh 
```bash
# Debian based Linux
sudo apt install zsh 

# Arch based Linux
sudo pacman -S zsh

# Fedora
sudo dnf install zsh

# OpenSUSE
zypper install zsh

# OpenBSD
pkg_add zsh

# FreeBSD
pkg install zsh

# Alpine
apk add zsh

# Funtoo/Gentoo
emerge app-shells/zsh

# Homebrew
brew install zsh
```
Next, install [oh-my-zsh](https://ohmyz.sh) to add plugins and themes to zsh.
```bash
# via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# or via wget
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
```
After install oh-my-zsh u can use the theme I use... (Fijarse en la compu grande para continuar para la configuracion de oh-my-zsh)

#### To install nushell
[Nushell](https://nushell.sh) is a very visual shell, with a table system for visualize better the ls, open and see better .json files on the same terminal. See the [GitHub Nushell](https://github.com/nushell/nushell) doc

```bash

# Homebrew 
brew install nushell

# After install it, open nushell on the terminal typing nu.
nu

# Or also can add it to the default shells
sudo echo $(which nu) | sudo tee -a /etc/shells

# After adding at the file of the possible shells, restart the console or the system and do
chsh -S $(which nu)
# Finally restart the system and it could put nushell as your default shell
```

#### To install Fish
[Fish](https://fishshell.com/docs/current/index.html) is a powerfully shell and easy to use, with some configurations easy to apply and else.

```bash
# Homebrew
brew install fish

# Debian (adding the packages)
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
sudo apt update
sudo apt install fish

# Fedora
sudo dnf install fish

# Arch
sudo pacman -S fish

# To set fish as default shell do the same steps that nushell
```

The themes are of [Starship](https://starship.rs/), a very clean and brilliant prompt, so to install it

```bash
# via curl
curl -sS https://starship.rs/install.sh | sh

# Homebrew
brew install starship
```

Once installed starship you have to activate it. 

```bash
# To activate on zsh, open the .zshrc config file and add the next line at the end of that.
eval "$(starship init zsh)"

# To activate on Nushell, open the config file of nushell, find it with the next command on nushell:
$nu.config-path # It have to return something like /home/user/.config/nushell/config.nu

# After type it, open the file and add the next lines at the end of the file
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu") 

# To activate on fish add the next line to the end of the config.fish file (it could be on ~/.config/fish/config.fish)
starship init fish | source
```
And starship is now activate and in use.

## Applications, CLIs, etc.

My most used apps, commands or programs are the next:

### Fastfetch
It's a fetching of system data like ram memory available and used, space of disk, proccessor, etc. 
It is an upgrade of neofetch faster and better, it gives you better and more exact data.
```bash
# Homebrew
brew install fastfetch

# In some linux dists (on Debian 13 or newer)
sudo apt install fastfetch

sudo pacman -S fastfetch

sudo dnf install fastfetch

# Or you can add the repository and install it with apt
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch # Add the repository
sudo apt update # Update the repositories
sudo apt install fastfetch # Install fastfetch
```
### Nvim/Neovim
Nvim or neovim is a fork of vim, more oriented to IDE, it is basically a powerfull text editor, with possibility to add plugins easier (with lazyvim). 
[The official repository of Nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md) explain how to download it as well.
```bash
# Homebrew 
brew install nvim

# Arch
sudo pacman -S neovim

# Debian
sudo apt install neovim

# Fedora
sudo dnf install -y neovim
```
After install nvim you can install a plugin manager like [Lazyvim](http://www.lazyvim.org/)
```bash
# Installation of Lazyvim

# First do a backup of the your current nvim config:
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone the lazyvim repository
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove the .git folder
rm -rf ~/.config/nvim/.git

# And finally, open nvim
nvim
```
To configure nvim, u can open the main config file, the config.vim to configure it with vimscript or also can be config.lua to configure it with lua.
If you want, you can copy my configuration reeplacing the nvim folder of the .config directory on your computer with the nvim folder of the valen.dots.
```bash
# Delete the nvim folder of .config if it exists, remember do the backup before delete it 
rm -rf ~/.config/nvim/

# Copy the nvim folder, with the pwd here
cp nvim/ ~/.config/
```

### Brave Browser
The browser I use is Brave.
You also can visit [The Brave Browser](https://brave.com) official website
```bash
# Install Brave via curl with one command
curl -fsS https://dl.brave.com/install.sh | sh

# Adding the repository to install with apt
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser


# Fedora 41+, with dnf5
sudo dnf install dnf-plugins-core

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser


# Fedora < 41, Rocky/RHEL 
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser


# Fedora Silverblue/Kinoite/Sway Atomic/Budgie Atomic
run0 curl -fsSLo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

run0 rpm-ostree install brave-browser


# OpenSUSE
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo zypper install brave-browser


# Arch with yay
yay -Sy brave-bin
```

### Konsole
Sometimes I use konsole as well, the x terminal emulator of KDE plasma environment. It is simple, customizable and splitable, so if you have another terminal emulator of another environment and you would like to try konsole you can install it
```bash
# Debian 
sudo apt install konsole

# Fedora
sudo dnf install konsole

# Arch with an environment that wasn't KDE Plasma
sudo pacman -S konsole

# or with flatpak
flatpak install flathub org.kde.konsole
```

### Ranger
Ranger is a file manager to see all the files and folder easier. This shows all in form of tree.

```bash
# Debian
sudo apt install ranger

# Fedora
sudo dnf install ranger

# Arch
sudo pacman -S ranger

# Execution
ranger
```

### Tree
Tree is a file visualizer, it is like a better ls, it shows the dirs and files in a tree form

```bash
# Debian
sudo apt install tree

# Fedora
sudo dnf install tree

# Arch
sudo pacman -S tree

# Execution
tree

# Some flags
tree -a # or --all to see hidden directories and files
tree -d # or --dirs-only to see only dirs
```

### Gh (GitHub CLI)
It is a CLI (Command Line Interface) of GitHub to manage repos easier. It be able to create, delete, list, clone and else repositories from github.

```bash
# Homebrew
brew install gh

# Via curl
curl -sS https://webi.sh/gh | sh
```

After install gh CLI you have to log in with your GitHub account.
```bash

# Log in with GitHub
gh auth login
```
