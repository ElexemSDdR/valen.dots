# My config
> [!IMPORTANT]
> All the configurations files of all of this will be on the configs folder, to apply my configuration go to that directory and copy the configuration files to the specified folder of each one.

## Package Manager

[Homebrew](https://brew.sh) is a package manager for Linux and MacOS fast and easy to use. It can install packages that linux could not have.
```bash
# Install Homebrew via curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[Cargo](https://doc.rust-lang.org/cargo/) is another package manager that I use, but isn't just a pacakge manager, it is the rust compiler, but with this install something more.

## Shells

Here could be 3 shells: **zsh**, **Nushell** or **Fish**. Currently I use a lot **Fish**.
#### To install zsh 
```bash
# Debian based Linux
sudo apt install zsh 
```

```bash
# Arch based Linux
sudo pacman -S zsh
```

```bash
# Fedora
sudo dnf install zsh
```

```bash
# OpenSUSE
zypper install zsh
```

```bash
# OpenBSD
pkg_add zsh
```

```bash
# FreeBSD
pkg install zsh
```

```bash
# Alpine
apk add zsh
```

```bash
# Funtoo/Gentoo
emerge app-shells/zsh
```

```bash
# Homebrew
brew install zsh
```
Next, install [oh-my-zsh](https://ohmyz.sh) to add plugins and themes to zsh.
```bash
# via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
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
```

```bash
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
```

```bash
# Debian (adding the packages)
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
sudo apt update
sudo apt install fish
```

```bash
# Fedora
sudo dnf install fish
```

```bash
# Arch
sudo pacman -S fish
```
To set fish as default shell do the same steps that nushell


#### Themes
The themes are of [Starship](https://starship.rs/), a very clean and brilliant prompt, so to install it

##### Via curl
```bash
curl -sS https://starship.rs/install.sh | sh
```

##### Homebrew
```bash
brew install starship
```

Once installed starship you have to **activate** it. 

##### On Zsh
```bash
# To activate on zsh, open the .zshrc config file and add the next line at the end of that.
eval "$(starship init zsh)"
```

##### On Nushell
```bash
# To activate on Nushell, open the config file of nushell, find it with the next command on nushell:
$nu.config-path # It has to return something like /home/user/.config/nushell/config.nu

# After type it, open the file and add the next lines at the end of the file
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu") 
```

##### On Fish
```bash
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
```

```bash
# In some linux dists (on Debian 13 or newer)
sudo apt install fastfetch
```

```bash
# Arch
sudo pacman -S fastfetch
```

```bash
# Fedora
sudo dnf install fastfetch
```

```bash
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
```

```bash
# Arch
sudo pacman -S neovim
```

```bash
# Debian
sudo apt install neovim
```

```bash
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
To configure nvim, u can open the main config file, the init.vim to configure it with vimscript or also can be init.lua to configure it with lua. It finds on ~/.config/nvim usually

### Brave Browser
One of the two browsers I use is Brave. Based on Chromium, it is a fast and privacy-focused browser that blocks ads and trackers by default. It also has a built-in Tor mode for enhanced privacy.

You also can visit [The Brave Browser](https://brave.com) official website
```bash
# Install Brave via curl with one command
curl -fsS https://dl.brave.com/install.sh | sh
```

```bash
# Adding the repository to install with apt
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

```bash
# Fedora 41+, with dnf5
sudo dnf install dnf-plugins-core

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser
```

```bash
# Fedora < 41, Rocky/RHEL 
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser
```

```bash
# Fedora Silverblue/Kinoite/Sway Atomic/Budgie Atomic
run0 curl -fsSLo /etc/yum.repos.d/brave-browser.repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

run0 rpm-ostree install brave-browser
```

```bash
# OpenSUSE
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo zypper install brave-browser
```

```bash
# Arch with yay
yay -Sy brave-bin
```

### Zen Browser
This is the second browser I use, and the current I am using. Based on FireFox, [Zen Browser](https://zen-browser.app) it is a beautiful, customizable and is the best option (to me) to be more focused on the work and else.

```bash
# On Linux is recommended to install it via flatpak
flatpak install flathub app.zen_browser.zen

# To run it
flatpak run app.zen_browser.zen
```

### Konsole
Sometimes I use konsole as well, the x terminal emulator of KDE plasma environment, but i prefer and use anothers one. It is simple, customizable and splitable, so if you have another terminal emulator of another environment and you would like to try konsole you can install it
```bash
# Debian 
sudo apt install konsole
```

```bash
# Fedora
sudo dnf install konsole
```

```bash
# Arch with an environment that wasn't KDE Plasma
sudo pacman -S konsole
```

```bash
# or with flatpak
flatpak install flathub org.kde.konsole
```

### Ranger
Ranger is a file manager to see all the files and folder easier. This shows all in form of tree.

```bash
# Debian
sudo apt install ranger
```

```bash
# Fedora
sudo dnf install ranger
```

```bash
# Arch
sudo pacman -S ranger
```

#### Execution
```bash
ranger
```

### Tree
Tree is a file visualizer, it is like a better ls, it shows the dirs and files in a tree form

```bash
# Debian
sudo apt install tree
```

```bash
# Fedora
sudo dnf install tree
```

```bash
# Arch
sudo pacman -S tree
```

#### Execution
```bash
tree
```

```bash
# Some flags
tree -a # or --all to see hidden directories and files
tree -d # or --dirs-only to see only dirs
```

### Gh (GitHub CLI)
It is a CLI (Command Line Interface) of GitHub to manage repos easier. It be able to create, delete, list, clone and else repositories from github.

```bash
# Homebrew
brew install gh
```

```bash
# Via curl
curl -sS https://webi.sh/gh | sh
```

After install gh CLI you have to log in with your GitHub account.
```bash
# Log in with GitHub
gh auth login
```

### Kitty
[Kitty](https://sw.kovidgoyal.net/kitty/) is the terminal emulator that I currently use with Alacritty. It is a very customizable one and it is one of a very popular terminal emulators of linux world. The same is a GPU based terminal so it can renderize images on the terminal, so you can put a background image on it.

```bash
# Curl
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
> [!NOTE]
> I recommend install kitty via curl, but if you install kitty via curl, the bin will not be on the /bin folder of the system neither in the /usr/bin, it only will have the bin on the kitty.app folder (ubicated at ~/.local), you have to create a symbolic link at that kitty bin. 
> Kitty also won't the icon or the program to execute it with the initial menu, it only have the bin to execute it via terminal, you gotta create the .desktop or copy the made file on the configs folder to execute it without the terminal or put it as default terminal.

```bash
# Make the symbolic link of the kitty bin
ln -s /home/<user>/.local/kitty.app/bin/kitty /usr/bin/kitty
```

```bash
# Homebrew
brew install kitty
```

### Alacritty
The terminal emulator that I use currently with kitty is [Alacritty](https://alacritty.org). A super fast terminal emulator built on rust. I recomend to use cargo for the installation, the nearest of Alacritty (this is to have no problems with the version, 'cause it could affect some other apps like neovim, putting more than one space or deleting more than one character when you press those keys, etc.)

```bash
# Via Homebrew
brew install alacritty
```

```bash
# Or with Cargo
cargo install alacritty
```

> [!NOTE]
> If you install Alacritty via cargo there'll not be a directly access to alacritty (it install only the bin file), it means that u have to execute it only with the terminal, it has the same "problem" that kitty. If u search "alacritty" or similar on the initial menu, it won't find anything.
> You gotta create the .desktop file of alacritty or copy the file made on the configuration to put it as default terminal or to get the executable application it without only the terminal.

### The Fuck
The Fuck is an CLI that detect errors after execute an incorrect command and indicates you how to write and execute it well. It is write on python.

```bash
# Via brew
brew install thefuck
```

```bash
# on Arch
sudo pacman -S thefuck
```

```bash
# using pip on other systems
pip install thefuck
```

```bash
# on FreeBSD based
pkg install thefuck
```

```bash
# On Ubuntu or Linux Mint
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user
```

Then you have to add the bin or the command to use it.

Copy the next line to the end of your .bashrc o .zshrc if you use some of those.
```bash
eval $(thefuck --alias)
```

Or if you use fish (like in my case) do the following function to the functions.fish, or copy the functions on the configs/shells/fish on my configuration

```bash
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end
```
