{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ananicy.nix
  ];
  security.rtkit.enable = true;
}
