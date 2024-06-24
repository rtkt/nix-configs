{lib, ...}: {
  imports = [
    ./ananicy.nix
  ];
  security.rtkit.enable = lib.mkDefault true;
}
