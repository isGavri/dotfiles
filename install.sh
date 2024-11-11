
function set_usr_dirs() {
  echo "Setting up user dirs"
  echo "Installing needed package"
  sleep 2
  sudo pacman -S xdg-user-dirs
  xdg-user-dirs-update
}

function pkgs_install() {
  echo "Installing official packages"
  sleep 2
  sudo pacman -S --needed - < pkgs.txt

}

function set_yay() {
  echo "Going into "$HOME"/Desktop"
  sleep 2
  cd $HOME/Desktop/
  echo "Clonning yay.git"
  sleep 2
  git clone https://aur.archlinux.org/yay.git
  cd yay
  echo "Building package"
  sleep 2
  makepkg -si

}

function yay_install() {
  echo "Installing aur packages"
  cd $HOME/dotfiles/
  sleep 2
  yay -S - <pkgsaur.txt
}

function config_files() {
  echo "Moving into dotfiles directory"
  sleep 2
  cd $HOME/dotfiles/
  echo "Creating symlinks of configuration files"
  sleep 2
  cp -rsf $HOME/dotfiles/home/. ~
  echo "Copy wallpapers"
  sleep 2
  cp -r $HOME/dotfiles/Wallpaperss/. ~/Pictures/Wallpaperss/
}

set_usr_dirs
pkgs_install
set_yay
yay_install
config_files
