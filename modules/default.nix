{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./go-shadowsocks2
  ];
}
