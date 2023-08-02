{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Hack" "DroidSansMono" "SourceCodePro"];})
    python311
    qmk
    gcc

    # ---------------------------------- Editors
    neovim-nightly
    vifm
    kitty

    # ---------------------------------- Browsers
    google-chrome
    firefox

    # ---------------------------------- Hardware
    networkmanagerapplet
    pw-viz
    bluetuith
    brillo

    # ---------------------------------- CLI tools
    hyperfine
    wl-screenrec
    wget
    ripgrep
    fd
    trashy
    xdragon
    nix-init
    tldr
    asciinema

    # ---------------------------------- Git
    inputs.src-cli.packages.x86_64-linux.default
    gh
    chezmoi

    # ---------------------------------- Secrets
    bitwarden-cli
    doppler

    # ---------------------------------- Archivers
    unzip
    xarchiver
    p7zip

    # ---------------------------------- Analitics
    htop
    btop
    duf
    gping
    tree
    erdtree
    neofetch
    onefetch
    progress

    # ---------------------------------- Graphics
    inkscape
    realesrgan-ncnn-vulkan
    imaginer
    kooha
    obs-studio
    # obs-cli
    vlc
    inputs.nixified-ai.packages.x86_64-linux.invokeai-nvidia
    # inputs.nixified-ai.packages.x86_64-linux.koboldai-nvidia

    # ---------------------------------- Wayland
    hyprpaper
    hyprpicker
    wl-clipboard
    wev
    imv
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    swappy
    fnott
    slurp
    # grim
  ];
}
