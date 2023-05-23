{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;
  programs.fzf.enableFishIntegration = true;
  programs.fzf.defaultCommand = "fd --hidden --follow --no-ignore --exclude .git --exclude node_modules";
  programs.fzf.fileWidgetCommand = config.programs.fzf.defaultCommand;
  programs.fzf.defaultOptions = [
    "--reverse"
    "--no-separator"
    "--border none"
    # "--height 40%"
    # "--strip-cwd-prefix"
    # "--bind tab:down"
    # "--bind shift-tab:up"
    # "--bind ctrl-space:select"
  ];
  # programs.fzf.fileWidgetOptions = config.programs.fzf.defaultOptions;

  home.sessionVariables = {
    # FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --hidden --follow --exclude .git";
    # FZF_CTRL_T_COMMAND="${config.home.sessionVariables.FZF_DEFAULT_COMMAND}";
    # FZF_DEFAULT_OPTS="--bind tab:down shift-tab:up";
  };
}
