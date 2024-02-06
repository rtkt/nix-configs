{pkgs, ...}: {
  nix = {
    gc = {
      dates = "04:00";
      options = "--delete-older-than 45d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
