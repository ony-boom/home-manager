install_yay() {
    echo "$PACKAGES"
    if ! command -v pacman &> /dev/null; then
        echo "You are not on arch based system"
        exit
    fi

    pacman -S --needed base-devel

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    rm -rf yay
}

setup_hyprland() {
    yay -S "$HYPRLAND_PACKAGES"
}

install_app() {
    gum confirm "Sync update ?" && yay -Syu

    yay -S "$PACKAGES"

    gum confirm "Use hyprland to ?" && setup_hyprland
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
