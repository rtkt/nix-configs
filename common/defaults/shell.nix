{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins =
      [
        "systemd"
        "common-aliases"
      ]
      ++ lib.optional (config.services.xserver.enable) "bgnotify";
    theme = "robbyrussell";
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.shellAliases = {
    ssh-agent = "ssh-agent -t ${config.programs.ssh.agentTimeout}";
    list-generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
  };
  environment.variables.EDITOR = "micro";
}
