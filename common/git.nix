{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "master";
      pull.rebase = true;
      user.email = "rtkt@protonmail.com";
      user.name = "rtkt";

      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/github_key";
    };
  };
}
