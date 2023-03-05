{
  config,
  pkgs,
  nixpkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      remmina
      keepassxc
      deluge
      gimp
      mpv
      ark
      cryptsetup
      radeontop
      redshift-plasma-applet
      lm_sensors
      corectrl
      wine-staging
      clementine
      nmap
      speedcrunch
      vivaldi
      libreoffice-qt
      chromium
      tdesktop
      thunderbird
      vscode
      winetricks
      virt-manager
      anydesk
      nix-alien
      nix-index
      nix-index-update
      shellcheck
      alejandra
      gnupg
      unrar
      marktext
      gnupg
      android-tools
      android-udev-rules
      simg2img
      tor-browser-bundle-bin
      nodejs
      nodePackages.npm
      oplpctools
    ];
    defaultPackages = [];
  };
  programs = {
    steam.enable = true;
  };
}
