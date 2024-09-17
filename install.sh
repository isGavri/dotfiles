function set_usr_dirs() {
  echo "Setting up user dirs"
  xdg-user-dirs-update
}

function pkgs_install() {
  echo "Installing official packages"

  sudo pacman -S --needed - <pkgs.txt

}

function set_yay() {

  "Going into home/notsy/Desktop"
  local workdir=$(cwd)
  cd /home/notsy/Desktop/
  "Clonning yay.git"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  "Building package"
  makepkg -si
  cd $workdir

}

function yay_install() {
  "Installing aur packages"
  yay -S - <pkgsaur.txt
}

function config_files() {
  local workdir=$(cwd)
  "Going into home/notsy/Desktop/"
  cd /home/notsy/Desktop/
  "Clonning dotfiles repo"
  git clone
  "Moving into dotfiles directory"
  cd dotfiles
  "Creating symlinks of configuration files"
  cp -rsf /home/notsy/Desktop/dotfiles/home/. ~
  "Symlink of wallpapers"
  cp -rsf /home/notsy/Desktop/dotfiles/Wallpaperss/. ~/Pictures/Wallpaperss/
  cd $workdir

}

set_usr_dirs
pkgs_install
set_yay
yay_install
config_files
