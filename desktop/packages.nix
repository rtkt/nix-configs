{
  config,
  pkgs,
  nixpkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      # zoom-us
      remmina
      keepassxc
      gimp
      mpv
      ark
      cryptsetup
      radeontop
      redshift-plasma-applet
      corectrl
      # wine-staging
      clementine
      nmap
      speedcrunch
      vivaldi
      libreoffice-qt
      chromium
      tdesktop
      thunderbird
      vscode
      # winetricks
      virt-manager
      anydesk
      nix-alien
      nix-index
      nix-index-update
      shellcheck
      alejandra
      # gnupg
      unrar
      marktext
      android-tools
      android-udev-rules
      simg2img
      tor-browser-bundle-bin
      nodejs
      nodePackages.npm
      oplpctools
      # cataclysm-dda
      git-repo
      anytype
      androidStudioPackages.beta
      pcsxr
      nextcloud-client
    ];
    defaultPackages = [];
  };
  programs = {
    steam.enable = true;
  };
}
