{ config, pkgs, lib, ... }: {
  imports = [ ./shellAliases.nix ];
  home.username = "charles";
  home.homeDirectory = "/home/charles";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    git
    htop
    qmk
    xarchiver
    wget
    ripgrep
    shopify-cli
    nodePackages.pnpm
    fd
    clifm
    vifm
    xclip
    chezmoi
    bat
    peek
    gcc
    realesrgan-ncnn-vulkan
    slack
    bitwarden-cli
    google-chrome
    firefox
    (nerdfonts.override { fonts = [ "Hack" "DroidSansMono" ]; })
    neovim-nightly
    # nodejs-19_x
    # python311
  ];
}
