install_packages() {
    local package_string="$1"

    # Convert space-separated string to newline-separated list
    echo "$package_string" | xargs yay -S --noconfirm
}

# install yay if not present
install_yay() {
    if ! command -v pacman &> /dev/null; then
        echo "You are not on an Arch-based system"
        exit 1
    fi

    sudo pacman -S --needed base-devel

    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si
    cd .. || exit
    rm -rf yay
}

# set up Hyprland-specific packages
setup_hyprland() {
    install_packages "$HYPRLAND_PACKAGES"
}

# install general packages and Hyprland packages
install_app() {
    gum confirm "Sync update?" && yay -Syu

    install_packages "$PACKAGES"

    gum confirm "Use Hyprland?" && setup_hyprland
}

# Main function to check for yay and perform installations
run() {
    if ! command -v yay &> /dev/null; then
        echo "Installing yay..." && install_yay
    else
        echo "yay is already installed, proceeding..."
    fi
    echo "Installing apps..." && install_app
}

run
