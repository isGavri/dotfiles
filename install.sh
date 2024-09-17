function set_usr_dirs() {
  echo "Setting up user dirs"
  sleep 2
  xdg-user-dirs-update
}

function pkgs_install() {
  echo "Installing official packages"
  sleep 2
  sudo pacman -S --needed - <pkgs.txt

}

function set_yay() {

  "Going into home/notsy/Desktop"
  sleep 2
  local workdir=$(cwd)
  cd /home/notsy/Desktop/
  "Clonning yay.git"
  sleep 2
  git clone https://aur.archlinux.org/yay.git
  cd yay
  "Building package"
  sleep 2
  makepkg -si
  cd $workdir

}

function yay_install() {
  "Installing aur packages"
  sleep 2
  yay -S - <pkgsaur.txt
}
function gtk_theme() {
  echo "Installing gtk-engine-murrine"
  sleep 2
  sudo pacman -S gtk-engine-murrine
  echo "Clonning repo"
  sleep 2
  git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
  echo "Moving to repo"
  sleep 2
  cd Gruvbox-GTK-Theme
  echo "Runing install script"
  sleep 2
  ./install.sh -n Gruvbox -t blue -c dark
}

function config_files() {
  local workdir=$(cwd)
  "Moving into dotfiles directory"
  sleep 2
  cd /home/notsy/Desktop/
  cd dotfiles
  "Creating symlinks of configuration files"
  sleep 2
  cp -rsf /home/notsy/Desktop/dotfiles/home/. ~
  "Symlink of wallpapers"
  sleep 2
  cp -rsf /home/notsy/Desktop/dotfiles/Wallpaperss/. ~/Pictures/Wallpaperss/
  cd /home/notsy/Desktop/
  gtk_theme
  cd $workdir

}

set_usr_dirs
pkgs_install
set_yay
yay_install
config_files
