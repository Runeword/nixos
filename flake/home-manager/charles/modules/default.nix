{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./readline.nix
    ./alacritty.nix
    ./kitty.nix
    # ./i3.nix # X11
    # ./feh.nix # X11
    # ./picom.nix # X11
    ./ssh.nix
    ./tmux.nix
    ./neovim.nix
    ./starship.nix
    ./broot.nix
    ./zoxide.nix
    ./fzf.nix
    ./home.nix
    ./packages.nix
    ./shellAliases.nix
    ./nushell.nix
    ./git.nix
    ./bash
    ./fish
    ./bat
    ./waybar
    # ./eww
    # ./dircolors.nix
  ];

  # wayland.windowManager.sway = {
  #   enable = true;
  #   config = rec {
  #     modifier = "Mod4";
  #     terminal = "kitty";
  #   };
  # };

  programs = {
    home-manager.enable = true;

    vscode.enable = true;

    jq.enable = true;

    direnv.enable = true;
    direnv.enableBashIntegration = true;
    direnv.nix-direnv.enable = true;
  };
}
