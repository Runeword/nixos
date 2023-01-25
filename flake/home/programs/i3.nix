{ config, pkgs, lib, ... }: {
  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config.modifier = "Mod4";
  xsession.windowManager.i3.config.floating.modifier = "Mod4";
  xsession.windowManager.i3.config.terminal = "alacritty";
  xsession.windowManager.i3.config.window.hideEdgeBorders = "smart";
  xsession.windowManager.i3.config.focus.newWindow = "focus";
  xsession.windowManager.i3.config.fonts = {
    names = [ "Noto Sans Regular" ];
    size = 20.0;
  };
  xsession.windowManager.i3.config.colors.focused = {
    background = "#00000000";
    border = "#00000000";
    childBorder = "#0080ff60";
    indicator = "#e345ff";
    text = "#ffffff";
  };
  xsession.windowManager.i3.config.keybindings =
  let
    mod = config.xsession.windowManager.i3.config.modifier;
  in {
    # Keybindings
    "${mod}+q" = "kill";
    "${mod}+space" = "floating toggle";
    "${mod}+u" = "exec warpd --grid";
    # Focus workspace
    "${mod}+1" = "workspace 1";
    "${mod}+2" = "workspace 2";
    "${mod}+3" = "workspace 3";
    "${mod}+4" = "workspace 4";
    "${mod}+5" = "workspace 5";
    "${mod}+6" = "workspace 6";
    "${mod}+7" = "workspace 7";
    "${mod}+8" = "workspace 8";
    "${mod}+9" = "workspace 9";
  };
  
  xsession.windowManager.i3.extraConfig = ''
  for_window [class=.*] border pixel 6, focus
  '';
}
