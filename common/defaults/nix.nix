{
  lib,
  pkgs,
  ...
}: {
  nix = {
    gc = {
      dates = lib.mkDefault "04:00";
      options = lib.mkDefault "--delete-older-than 45d";
    };
    optimise = {
      automatic = lib.mkDefault true;
      dates = [
        "04:40"
      ];
    };
    extraOptions = lib.mkDefault ''
      experimental-features = nix-command flakes
    '';
  };
}
