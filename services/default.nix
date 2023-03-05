{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./go-shadowsocks2
    ./n8n
    ./ntfy
    ./samba-for-ps2
  ];
}
