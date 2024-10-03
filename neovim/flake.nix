{
  description = "My neovim flake";

  nixConfig.extra-substituters = [
    "https://runeword-neovim.cachix.org"
    "https://nix-community.cachix.org"
  ];

  nixConfig.extra-trusted-public-keys = [
    "runeword-neovim.cachix.org-1:Vvtv02wnOz9tp/qKztc9JJaBc9gXDpURCAvHiAlBKZ4="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  inputs.neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";

  # inputs.neovim.url = "github:neovim/neovim?dir=contrib";
  # inputs.neovim.url = "github:neovim/neovim/stable?dir=contrib";
  # inputs.neovim.inputs.nixpkgs.follows = "nixpkgs";

  outputs =
    { self, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
      };

      neovim-override = pkgs.neovim.override {
        # withPython3 = true;
        # withNodeJs = true;
        # package = pkgs.neovim-nightly;
      };

      neovim-with-dependencies = pkgs.symlinkJoin {
        name = "neovim";
        paths = [ neovim-override ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = with pkgs; ''
          rm $out/bin/nvim
          makeWrapper ${writeShellScript "nvim-wrapper" ''
            #!/usr/bin/env bash
            if [ ! -e "$HOME/.config/nvim" ]; then
              mkdir -p "$HOME/.config"
              ln -s ${./config} "$HOME/.config/nvim"
            fi
            exec ${neovim-override}/bin/nvim "$@"
          ''} $out/bin/nvim --prefix PATH : ${
            lib.makeBinPath [
              nodePackages.vls
              nodePackages.typescript-language-server
              nodePackages.bash-language-server
              nodePackages.eslint
              pyright
              vscode-langservers-extracted
              yaml-language-server
              lua-language-server
              selene
              marksman
              ccls
              nil
              alejandra
              nixfmt-rfc-style
              shfmt
              shellcheck
              shellharden
              terraform-ls
              gopls
              delve
              rust-analyzer
              taplo
              black
              isort
              typos-lsp
            ]
          }
        '';
      };
    in
    {
      apps.${system} = {
        default = {
          type = "app";
          program = "${neovim-with-dependencies}/bin/nvim";
        };
      };

      packages.${system} = {
        default = neovim-with-dependencies;
        runeword-neovim = neovim-with-dependencies;
      };
    };
}

# Run the flake :
# nix run "github:Runeword/dotfiles?dir=neovim"
# nix run $HOME/neovim

# {
#   description = "My own Neovim flake";
#   # # inputs.neovim.url = "github:neovim/neovim/v0.8.3?dir=contrib";
#   inputs.neovim.url = "github:neovim/neovim/nightly?dir=contrib";
#   inputs.neovim.inputs.nixpkgs.follows = "nixpkgs";
#   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
# outputs = { self, nixpkgs, neovim }: {
#   packages.x86_64-linux.default = neovim.packages.x86_64-linux.neovim;
#   apps.x86_64-linux.default = {
#     type = "app";
#     program = "${neovim.packages.x86_64-linux.neovim}/bin/nvim";
#   };
# };
