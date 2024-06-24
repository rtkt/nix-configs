{
  config,
  pkgs,
  lib,
  ...
}: {
  environment = {
    systemPackages =
      [
        pkgs.curl
      ]
      ++ (
        if config.services.xserver.enable == true
        then [pkgs.micro]
        else [pkgs.micro-nogui]
      );
    variables = {
      EDITOR = "micro";
    };
  };
  programs.zsh.ohMyZsh = {
    enable = lib.mkDefault true;
    plugins =
      [
        "systemd"
        "common-aliases"
      ]
      ++ lib.optional (config.services.xserver.enable) "bgnotify";
    theme = lib.mkDefault "robbyrussell";
  };
  programs.zsh.enable = lib.mkDefault true;
  users.defaultUserShell = lib.mkOverride 900 pkgs.zsh;
  programs.zsh.shellAliases = {
    ssh-agent = "ssh-agent -t ${config.programs.ssh.agentTimeout}";
    list-generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
  };
}
