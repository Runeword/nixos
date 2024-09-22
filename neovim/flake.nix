{
  description = "My neovim flake";
  # nix run $HOME/neovim
  # nix run "github:Runeword/dotfiles?dir=neovim"

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

  inputs.cachix.url = "github:cachix/cachix";

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
    in

    rec {
      apps.${system} = rec {
        nvim.type = "app";
        nvim.program = "${packages.${system}.default}/bin/nvim";
        default = nvim;
      };

      packages.${system} =
        let
          myneovim = pkgs.neovim.override {
            # withPython3 = true;
            # withNodeJs = true;
            # package = pkgs.neovim-nightly;
            # extraPackages = [
            # ];
          };
        in

        rec {
          default = neovim-deps;
          neovim-deps = pkgs.symlinkJoin {
            name = "neovim";
            paths = [ myneovim ];
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = with pkgs; ''
              rm $out/bin/nvim
              BINPATH=${
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
                  # terraform-lsp
                ]
              }
              makeWrapper ${myneovim}/bin/nvim $out/bin/nvim --prefix PATH : $BINPATH
            '';
          };
        };
    };
}

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
