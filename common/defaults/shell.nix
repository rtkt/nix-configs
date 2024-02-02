{config, pkgs, ...}: {
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = ["systemd"];
    theme = "robbyrussell";
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.shellAliases = {
    ssh-agent = "ssh-agent -t ${config.programs.ssh.agentTimeout}";
    list-generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
  };
}
