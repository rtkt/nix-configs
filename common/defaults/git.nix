{lib, ...}: {
  programs.git = {
    enable = lib.mkDefault true;
    config = {
      init.defaultBranch = lib.mkDefault "master";
      pull.rebase = lib.mkDefault true;
      user.email = lib.mkDefault "rtkt@protonmail.com";
      user.name = lib.mkDefault "rtkt";

      commit.gpgsign = lib.mkDefault true;
      gpg.format = lib.mkDefault "ssh";
      user.signingkey = lib.mkDefault "~/.ssh/github_key";
    };
  };
}
