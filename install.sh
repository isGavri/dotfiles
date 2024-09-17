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
function gtk_theme() {
  echo "Installing gtk-engine-murrine"
  sudo pacman -S gtk-engine-murrine
  echo "Clonning repo"
  git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme
  echo "Movin to repo"
  cd Gruvbox-GTK-Theme
  "Runing install script"
  ./install.sh -n Gruvbox -t blue -c dark
}

function config_files() {
  local workdir=$(cwd)
  "Moving into dotfiles directory"
  cd /home/notsy/Desktop/
  cd dotfiles
  "Creating symlinks of configuration files"
  cp -rsf /home/notsy/Desktop/dotfiles/home/. ~
  "Symlink of wallpapers"
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
