# Mi configuración
> [!IMPORTANT]
> Todos los archivos de configuración de todo esto estarán en la carpeta "configs", para aplicar mi configuración andá a esa carpeta y copiá los archivos de configuración a la carpeta específica de cada uno.

## Gestor de paquetes

[Homebrew](https://brew.sh) es un gestor de paquetes para Linux y MacOS rápido y facil de usar. Podés instalar paquetes que podrían no estar en los repositorios oficiales de Linux de manera sencilla.

```bash
# Instalar Homebrew via curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[Cargo](https://doc.rust-lang.org/cargo/) is another package manager that I use, but isn't just a pacakge manager, it is the rust compiler, but with this install something more.
[Cargo](https://doc.rust-lang.org/cargo/) es otro gestor de paquetes que uso, pero no es solo un gestor de paquetes, sino que también es el compilador de Rust, pero con esto instalamos algo más.

## Shells

Acá pueden haber 3 shells: **zsh**, **Nushell** ó **Fish**. Actualmente uso mucho **Fish**
#### Para instalar Zsh
```bash
# Basados en debian
sudo apt install zsh 
```

```bash
# Basados en Arch
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
Después podés instalar [oh-my-zsh](https://ohmyz.sh) para agregar plugins o extensiones y temas para zsh.
```bash
# via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
# ó via wget
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
```
Después de instalar oh-my-zsh podés usar el tema y los plugins que usaba... (Fijarse en la compu grande para continuar para la configuracion de oh-my-zsh)

#### Para instalar Nushell
[Nushell](https://nushell.sh) es una shell muy visual, con un sistema de tablas para visualizar mejor el `ls`, abrir y ver de mejor manera archivos .json en la misma terminal y poco más. Podes ver la documentación en el [GitHub de Nushell](https://github.com/nushell/nushell)

```bash
# Homebrew 
brew install nushell

# Después de instalarlo, para usar nushell tenés que poner nu en la terminal.
nu
```

```bash
# Ó también podes agregarlo a las shells por defecto.
sudo echo $(which nu) | sudo tee -a /etc/shells

# Después de añadirla al archivo de las posibles shells reiniciá la terminal o el sistema para después hacer
chsh -S $(which nu)
# Finalmente reiniciá el sistema y eso debería de haber puesto a nushell como la shell por defecto
```

#### Para instalar Fish
[Fish](https://fishshell.com/docs/current/index.html) es una shell potente y fácil de usar, con configuraciones y funciones fáciles de agregar y demás.

```bash
# Homebrew
brew install fish
```

```bash
# Debian (añadiendo los paquetes)
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
Para poner fish como terminal por defecto ha que hacer los mismos pasos que con Nushell.

#### Temas
Los temas son de [Starship](https://starship.rs/), un prompt muy potente y brillante, así que para instalarlo:

##### Via curl
```bash
curl -sS https://starship.rs/install.sh | sh
```

##### Homebrew
```bash
brew install starship
```

Una vez instalado **Starship** falta acrivarlo.

##### On Zsh
```bash
# Para activarlo en zsh, abrí el archivo de configuración .zshrc (que debería estar en ~/.config/.zshrc) y agregá la siguiente línea al final del mismo.
eval "$(starship init zsh)"
```

##### On Nushell
```bash
# Para activarlo en nushell primero abrí el archivo de configuración de nushell, con el siguiente comando podés encontrarlo:
$nu.config-path # Debería devolver algo como /home/user/.config/nushell/config.nu

# Después de escribir lo anterior, abrí el archivo y agregá la siguiente línea al final del mismo:
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu") 
```

##### On Fish
```bash
# Para activarlo en fish abrí su archivo de configuración (que debería estar en ~/.config/fish/config.fish) y agregá la siguiente línea al final del mismo
starship init fish | source
```
Y ahora **Starship** debería estar activado y listo para usar

## Aplicaciones, CLIs, etc.

Las apps, comandos y programas que más uso son los siguientes:

### Fastfetch
Es un fetching o una obtención de algunos datos del sistema como la ram usada y disponible, el espacio del disco, el procesador, etc. Es una mejora de neofetch, más rápido y mejor, ya que te da una mejor y más exacta información.
```bash
# Homebrew
brew install fastfetch
```

```bash
# En algunas distribuciones de Linux (en Debian 13 ó más nuevos)
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
# Ó podes agregar los paquetes e instalarlo con apt
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch # Añadí el repositorio
sudo apt update # Actualizá los paquetes
sudo apt install fastfetch # Instalá fastfetch

```
### Nvim/Neovim
Nvim ó NeoVim es un fork de vim (un programa escrito sobre esa base), más orientado a ser un IDE, es básicamente un editor de texto más potente, con la posibilidad de añadirle plugins o extensiones fácilmente (en este caso con LazyVim)
[El repositorio oficial de Nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md) explica también como descargarlo.
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
Después de instalar nvim podés agregarle algún gestor de plugins cómo [Lazyvim](http://www.lazyvim.org/) (es el que uso)
```bash
# Instalación de Lazyvim

# Primero hacé un backup ó un respaldo de tu configuración de neovim si es que ya tenés:
# Requerido
mv ~/.config/nvim{,.bak}

# Opcional pero recomendado
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Cloná el repositorio de LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remové la carpeta .git
rm -rf ~/.config/nvim/.git

# Y finalmente abrí nvim
nvim
```
Esto te va a dar una configuración por defecto con varias cosas ya integradas para poder codear bastante fácil, pero podes agregarle o sacarle los plugins que quieras.
Para configurar nvim, podés abrir el archivo de configuración init.vim para configurarlo con vimscript, ó también puede ser init.lua para configurarlo con lua, que es el que de paso viene por defecto con esta configuración. El mismo se encuentra normalmente en ~/.config/nvim

### El navegador Brave
Uno de los dos navegadores que uso es Brave. Basado en Chormium, es un navegador rápido y enfocado en privacidad, bloquea anuncios y trackers por defecto. También tiene implementado un modo Tor para aumentar aún más tu privacidad navegando al usarlo.

También podés visitar el sitio oficial de [Brave](https://brave.com).
```bash
# Para instalar Brave con un solo comando
curl -fsS https://dl.brave.com/install.sh | sh
```

```bash
# Añadiendo los repositorios y descargándolo con apt
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
```

```bash
# Fedora 41+, con dnf5
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

### El navegador Zen
Este es el segundo navegador que uso, y el que actualmente estoy usando. Basado en FireFox, [Zen Browser](https://zen-browser.app) es un navegador hermoso, customizable y la mejor opción (al menos para mí) para centrarte más en trabajo y demás.

```bash
# En Linux es más recomendable instalarlo con Flatpak
flatpak install flathub app.zen_browser.zen

# Y para correrlo
flatpak run app.zen_browser.zen
```

### Konsole
A veces uso konsole también como un emulador de terminal, pero después van a ver los q más uso. Es el emulador x de terminal del entorno de escritorio KDE Plasma. Es simple, customizable y espliteable (o sea podés dividir la pantalla) así que si tenes algún otro entorno de escritorio que no sea KDE y queres probarlo podes instalarlo así
```bash
# Debian 
sudo apt install konsole
```

```bash
# Fedora
sudo dnf install konsole
```

```bash
# Arch con algún entorno que no sea KDE Plasma
sudo pacman -S konsole
```

```bash
# Ó con Flatpak
flatpak install flathub org.kde.konsole
```

### Ranger
Ranger es un gestor de archivos basado en la terminal, los archivos y carpetas se muestran en forma de árbol horizontalmente. El mismo te da la posibilidad de moverte entre carpetas más fácil que con ls y cd y de editar archivos más facilmente.

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

#### Ejecución
```bash
ranger
```

### Tree
Tree es un visualizador de archivos, te muestra los mismos en forma de árbol, actúa como un ls recursivo mostrandote los archivos en las carpetas y poco más.

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

#### Ejecución
```bash
tree
```

```bash
# Con algunas flags u opciones
tree -a # ó --all para ver archivos y directorios ocultos

```
```bash
tree -d # ó --dirs-only para ver solo directorios
```

### Gh (GitHub CLI)
Es un CLI (Command Line Interface o Interfaz de Línea de Comandos) para manejar o gestionar mejor o de manera más sencilla tus repositorios de GitHub desde la terminal. Podés crear, borrar, listar, clonar y demás los repositorios propios y otros (esto aplica para la clonación nomás).

```bash
# Homebrew
brew install gh
```

```bash
# Via curl
curl -sS https://webi.sh/gh | sh
```

Después de instalar el CLI de gh tenés que iniciar sesión en tu cuenta de GitHub.
```bash
# Inicia sesión en GitHub
gh auth login
```

### Kitty
[Kitty](https://sw.kovidgoyal.net/kitty/) es otro emulador de terminal que suelo usar (y el que uso actualmente). Es super customizable, super popular entre la comunidad y podes splitearlo como a konsole. El mismo es un emulador basado en la GPU, con la capacidad de renderizar imágenes y poco más.

```bash
# Homebrew
brew install kitty
```

```bash
# Curl
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
> [!NOTE]
> Recomiendo instalar kitty por via curl, pero si lo instalas por esa via, entonces el binario no va a estar en la carpeta /bin ni en la de /usr/bin, solo va a estar en la carpeta kitty.app (ubicada en ~/.local), vas a tener q crear un link simbólico o enlace simbólico para ese binario de kitty. 
> Kitty tampoco tendrá un icono o programa como para ejecutarlo, o sea buscandolo en el menú inicio no lo vas a encontrar, solo va a tener el binario para ejecutarlo mediante la terminal; vas a tener que crear el archivo .desktop (que son los que pueden hacer esas aplicaciones ejecutables) o copiarlo desde mi carpeta de configs para ejecutarlo sin la terminal o ponerlo como tu terminal por defecto.

```bash
# Hacer el enlace simbólico para el binario
ln -s /home/<user>/.local/kitty.app/bin/kitty /usr/bin/kitty
```

### Alacritty
Otro emulador de terminal que uso bastante junto con kitty es [Alacritty](https://alacritty.org). Un emulador de terminal muy rápido escrito en Rust. Recomiendo usar cargo para la instalación, el más cercano a Alacritty (esto es para no tener problemas con la versión, ya que podría afectar a otras apps de terminal como neovim, poniendo más de un espacio o borrando más de un caracter al presionar las teclas de espacio, borrar, etc. o sea hace como un doble click).

```bash
# Via Homebrew
brew install alacritty
```

```bash
# Or with Cargo
cargo install alacritty
```

> [!NOTE]
> Si instalas Alacritty por via cargo entonces vas a tener el mismo "problema" que con kitty, no vas a tener el archivo .desktop creado y vas a tener q hacerlo vos.
> Vas a tener q crear el archivo .desktop para alacritty o copiar el creado en la capeta configs para tener la aplicacion ejecutable de alacritty para poder ponerlo como terminal por defecto también.

### The Fuck
The Fuck es un CLI para detectar errores después de haber ejecutado un comando incorrectamente, te indica como escribirlo y ejecutarlo bien. El mismo está escrito en Python.

```bash
# Via brew
brew install thefuck
```

```bash
# on Arch
sudo pacman -S thefuck
```

```bash
# usando pip en otros sistemas
pip install thefuck
```

```bash
# en sistemas basados en FreeBSD
pkg install thefuck
```

```bash
# En Ubuntu ó Linux Mint
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user
```

Una vez instalado vas a tener que agregar el alias al binario para poder usarlo.

Copia la siguiente línea al archivo .bashrc o .zshrc si usas zsh o bash.

```bash
eval $(thefuck --alias)
```

Ó si usas fish (como en mi caso) hacé la siguiente función en el archivo functions.fish, o copiá las funciones hechas por mi en la carpeta configs/shells/fish de mi configuración

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
