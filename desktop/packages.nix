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
      gimp
      mpv
      ark
      cryptsetup
      radeontop
      redshift-plasma-applet
      corectrl
      clementine
      nmap
      speedcrunch
      vivaldi-plasma6
      libreoffice-qt
      chromium
      tdesktop
      thunderbird
      vscode
      virt-manager
      anydesk
      nix-alien
      nix-index
      nix-index-update
      shellcheck
      alejandra
      unrar
      marktext
      android-tools
      android-udev-rules
      simg2img
      tor-browser-bundle-bin
      oplpctools
      cataclysm-dda
      git-repo
      anytype
      nextcloud-client
    ];
    defaultPackages = [];
    plasma6.excludePackages = [
      pkgs.kdePackages.elisa
      pkgs.kdePackages.kate
      pkgs.kdePackages.krdc
    ];
  };
  programs = {
    steam.enable = true;
  };
}
