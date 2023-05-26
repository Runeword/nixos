{
  home.shellAliases = {
    # up = "up(){ realesrgan-ncnn-vulkan -i \"$1\" -o output.png; }; up";
    shn = "shutdown now";
    chrome = "google-chrome-stable";
    pick = "colorpicker";
    win = "xprop WM_CLASS";
    sin = "$HOME/.screenlayout/single.sh && feh --bg-fill $HOME/.config/Skin\ The\ Remixes.png";
    dua = "$HOME/.screenlayout/dual.sh";
    wa = "watch progress -q";
    mv = "mv -v";
    md = "mkdir -p";
    cp = "cp -v";
    b = "br -c :open_preview";
    bb = "br -c ':toggle_hidden;:toggle_perm;:toggle_dates'";
    bt = "__bluetooth";
    l = "command ls -A --color";
    ll = "command ls -hAltF --color";
    oi = "kitty +kitten icat";
    n = "nvim";
    r = "trash";
    c = "cd $(fd --type directory --hidden --follow --no-ignore --exclude .git --exclude node_modules | fzf --inline-info --cycle --preview 'ls -AxF {} | head -$FZF_PREVIEW_LINES' --preview-window right,50%,noborder --no-scrollbar)";
    ca = "cd $(fd --type directory --hidden --follow --no-ignore | fzf --cycle)";
    o = "xdg-open $(fd --type file --hidden --follow --no-ignore --exclude .git --exclude node_modules | fzf)";
    s = "source";
    ss = "src search";
    xc = "xclip -selection c";
    xp = "xclip -selection c -o";
    f = "feh --bg-fill";
    # xo = "xdg-open";

    # ______________________________________ NIX
    hs = "home-manager switch --flake $HOME/flake";
    hp = "home-manager packages | fzf --inline-info";
    ns = "sudo nixos-rebuild switch --flake $HOME/flake#charles";
    nd = "read -p 'nix develop $HOME/flake#' devShellName && nix develop $HOME/flake#$devShellName";
    nfi = "read -p 'nix flake init -t $HOME/templates#' templateName && nix flake init -t $HOME/templates#$templateName";
    nfs = "nix flake show";
    nfl = "nix flake lock";
    nr = "nix run";
    ng = "sudo nix-collect-garbage";
    ngd = "nix-env --delete-generations +10";
    ngl = "nix-env --list-generations";

    # ______________________________________ QMK
    # qc = "(cd $HOME/.config/qmk && qmk compile -kb ferris/sweep -km Runeword)";
    # qfl = "(cd $HOME/.config/qmk && qmk flash -kb ferris/sweep -km Runeword -bl dfu-split-left)";
    # qfr = "(cd $HOME/.config/qmk && qmk flash -kb ferris/sweep -km Runeword -bl dfu-split-right)";
    # qcd = "cd $HOME/.config/qmk/qmk_firmware/keyboards/ferris/keymaps/Runeword";
    # qd = "(cd $HOME/.config/qmk && qmk generate-compilation-database -kb ferris/sweep -km Runeword)";

    # ______________________________________ BLUETOOTH
    bc = "bluetoothctl";
    bh = "bluetoothctl help";
    bs = "bluetoothctl scan on";
    bo = "bluetoothctl power on ";
    bf = "bluetoothctl power off";

    # ______________________________________ NETWORK
    wo= "nmcli radio wifi on";
    wf= "nmcli radio wifi off";
    # nmcli networking off
    # nmcli networking on

    # ______________________________________ CHEZMOI
    chd = "chezmoi diff --reverse";
    chi = "chezmoi ignored";
    chc = "chezmoi cd";

    # ______________________________________ NPM
    npl="npm ls --depth=0";
    npg="npm ls -g --depth=0";
    npd="npm run dev";
    npi="npm i";

    # ______________________________________ TMUX
    t = "tmux";
    tl = "tmux ls";
    ta = "tmux attach -t";
    td = "tmux detach";
    tnw = "tmux new-window -n";
    tkw = "tmux kill-window";
    trw = "read -p 'Window name: ' name && tmux rename-window $name";
    tns = "tmux new -s";
    tks = "tmux kill-session";
    trs = "read -p 'Session name: ' name && tmux rename-session $name";
    tkk = "tmux kill-server";
    tss = "/nix/store/n229j84913c7y76h5m4fa1g18gqmgn09-tmuxplugin-resurrect-unstable-2022-05-01/share/tmux-plugins/resurrect/scripts/save.sh";
    trr = "[[ '$TERM_PROGRAM' == 'tmux' ]] && /nix/store/n229j84913c7y76h5m4fa1g18gqmgn09-tmuxplugin-resurrect-unstable-2022-05-01/share/tmux-plugins/resurrect/scripts/restore.sh";

    # ______________________________________ GIT
    gs = "git status";
    gt = "git stash";
    gtl = "git stash list";
    gty = "git stash apply";
    gpl = "git pull";
    gp = "git push";
    gpo = "git push origin";
    gd = "git diff";
    gdc = "git diff --cached";
    gc = "git commit";
    gcl = "git clone";
    gcp = "git cherry-pick";
    gk = "git checkout";
    gk-- = "git checkout --";
    gb = "git branch";
    gbd = "git branch -d";
    gl = "git log";
    gm = "git merge";
    grb = "git rebase";
    grs = "git reset";
    grs1 = "git reset HEAD~1";
    gwa = "git worktree add";
    gwl = "git worktree list";
    gwr = "git worktree remove";
  };
}
