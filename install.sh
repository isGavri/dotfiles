function set_usr_dirs() {
  echo "Setting up user dirs"
  echo "Installing needed package"
  sudo pacman -S xdg-user-dirs
  sleep 2
  xdg-user-dirs-update
}

function pkgs_install() {
  echo "Installing official packages"
  sleep 2
  sudo pacman -S --needed - <pkgs.txt

}

function set_yay() {

  echo "Going into home/notsy/Desktop"
  sleep 2
  local workdir=$(pwd)
  cd /home/notsy/Desktop/
  echo "Clonning yay.git"
  sleep 2
  git clone https://aur.archlinux.org/yay.git
  cd yay
  echo "Building package"
  sleep 2
  makepkg -si
  cd $workdir

}

function yay_install() {
  echo "Installing aur packages"
  sleep 2
  yay -S - <pkgsaur.txt
}
function gtk_theme() {
  echo "Installing gtk-engine-murrine"
  sleep 2
  sudo pacman -S gtk-engine-murrine
  echo "Clonning repo"
  mkdir Gruvbox
  cd Gruvbox
  sleep 2
  git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme .
  echo "Runing install script"
  sleep 2
  ./themes/install.sh -n Gruvbox -c dark
}

function config_files() {
  local workdir=$(pwd)
  echo "Moving into dotfiles directory"
  sleep 2
  cd /home/notsy/Desktop/
  cd dotfiles
  echo "Creating symlinks of configuration files"
  sleep 2
  cp -rsf /home/notsy/dotfiles/home/. ~
  echo "Symlink of wallpapers"
  sleep 2
  cp -rsf /home/notsy/dotfiles/Wallpaperss/. ~/Pictures/Wallpaperss/
  cd /home/notsy/Desktop/
  gtk_theme
  cd $workdir

}

set_usr_dirs
pkgs_install
set_yay
yay_install
config_files
