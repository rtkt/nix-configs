{
  config,
  pkgs,
  lib,
  ...
}: {
  environment = lib.mkIf (! config.boot.isContainer) {
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
      []
      ++ lib.optional (config.services.xserver.enable) "bgnotify";
    theme = lib.mkDefault "robbyrussell";
  };
  programs.zsh.enable = lib.mkDefault true;
  users.defaultUserShell = lib.mkOverride 900 pkgs.zsh;
  programs.zsh.shellAliases = {
    ssh-agent = "ssh-agent -t ${config.programs.ssh.agentTimeout}";
    list-generations = "nix-env -p /nix/var/nix/profiles/system --list-generations";
    rb = "nixos-rebuild ";
    rbb = "nixos-rebuild boot";
    rbt = "nixos-rebuild test";
    rbs = "nixos-rebuild switch";
    G = " | grep";
    H = " | head";
    T = " | tail";
    L = " | less";
    c = "cat";
    s = "systemctl";
    scat = "systemctl cat";
    sst = "systemctl status";
    sres = "systemctl restart";
    j = "journalctl";
    jb = "journalctl -xb";
    je = "journalctl -xe";
    l = "ls -lha";

    g = "git";
    ga = "git add";
    gc = "git commit -v";
    gca = "git commit --amend -v";
    gup = "git push";
    gdown = "git pull";
    gs = "git status";
    gl = "git log";
    dev = "nix develop -c $SHELL";
    m = "micro";
  };
}
