{ config, pkgs, libs, ... }: {
  #let
  #  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
  #    pname = "${lib.strings.sanitizeDerivationName repo}";
  #    version = ref;
  #    src = builtins.fetchGit {
  #      url = "https://github.com/${repo}.git";
  #      ref = ref;
  #    };
  #  };
  #in {

  imports = [
    ./readline.nix
    ./alacritty.nix
    ./i3.nix
    ./feh.nix
    ./ssh.nix
    ./tmux.nix
  ];

  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;
  programs.fzf.fileWidgetCommand = "fd --hidden --follow --no-ignore --max-depth 1 --exclude .git --exclude node_modules";
  programs.fzf.defaultOptions = [ "--no-separator" ];

  programs.rofi.enable = true;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.bashrcExtra = ''
    # bind ctrl-n to neovim
    bind -x '"\C-n":"nvim"'

    # unbind alt-number
    for i in "-" {0..9}; do bind -r "\e$i"; done

    # unbind ctrl-s and ctrl-q (terminal scroll lock)
    stty -ixon

    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 2h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    if [[ ! "$SSH_AUTH_SOCK" ]]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
    fi
  '';

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = false;
  programs.neovim.withNodeJs = true;
  programs.neovim.withPython3 = true;
  programs.neovim.package = pkgs.neovim-nightly;
  programs.neovim.extraPackages = with pkgs; [
  nodePackages.npm
  nodePackages.neovim
  nodePackages.prettier
  nodePackages.eslint
  nodePackages.typescript-language-server
  nodePackages.vscode-langservers-extracted
  sumneko-lua-language-server
  ];

  # programs.neovim.extraConfig = "luafile ~/flake/config/nvim/init.lua";

  # programs.neovim.plugins = with pkgs.vimPlugins; [
  #   nvim-lspconfig
  #   nvim-treesitter
  #   plenary-nvim
  #   (fromGitHub "HEAD" "itchyny/vim-cursorword")
  #   (fromGitHub "HEAD" "windwp/nvim-ts-autotag")
  #   (fromGitHub "HEAD" "tommcdo/vim-exchange")
  #   (fromGitHub "HEAD" "kyazdani42/nvim-web-devicons")
  #   (fromGitHub "HEAD" "kana/vim-arpeggio")
  # ];
}
