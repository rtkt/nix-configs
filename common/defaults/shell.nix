{
  config,
  pkgs,
  ...
}: {
  users.defaultUserShell = pkgs.elvish;
}
