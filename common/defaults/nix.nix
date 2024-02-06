{pkgs, ...}: {
  nix = {
    gc = {
      dates = "04:00";
      options = "--delete-older-than 45d";
    };
    optimise = {
      automatic = true;
      dates = [
        "04:40"
      ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
