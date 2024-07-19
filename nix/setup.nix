{pkgs}: let
  packages = [
    "nvm"
    "alacritty"
    "google-chrome"
    "jetbrains-toolbox"
    "visual-studio-code-bin"
  ];
in {
  arch = pkgs.writeShellApplication {
    name = "setup";
    runtimeInputs = with pkgs; [git gum];
    text = ''
      install_yay() {
      	pacman -S --needed base-devel

      	git clone https://aur.archlinux.org/yay.git
      	cd yay
      	makepkg -si

      	rm -rf yay
      }

      sync() {
      	yay -Syu
      }

      # programs that I preffer install using yay
      # cause it has some problem with nix or it's better using yay
      install_app() {
      	gum confirm "Sync update ?" && sync

      	yay -S ${builtins.concatStringsSep " " packages}
      }


      run() {
           if ! command -v yay &> /dev/null; then
           	echo "Installing yay" && install_yay
      	else
      		 echo "yay is already installed, proceeding..."
           fi

         	echo "Installing apps" && install_app
       	}
         run  # Optionally, you can call run here to execute it when building
    '';
  };
}
