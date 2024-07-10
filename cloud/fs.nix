let
	genMount = path: {
		"/media/${path}" = {
			device = path;
			fsType = "zfs";
		};
	};
in {
  boot.extraModprobeConfig = ''
    options zfs zfs_nopwrite_enabled=1
  '';
  boot.zfs = {
    devNodes = "/dev/disk/by-id";
    extraPools = [
    	"raid"
    	"filestorage"
    ];
  };
  fileSystems = {
    "/" = {
    	device = "root";
    	fsType = "zfs";	
    };
    "/boot" = {
      device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNX0W302758N-part2";
      fsType = "vfat";
      options = ["umask=177" "dmask=077" "uid=0" "gid=0"];
    };
  } // genMount "raid"
  	// genMount "filestorage"
  	// genMount "filestorage/files"
  	// genMount "filestorage/files/Games"
  	// genMount "filestorage/files/Videos"
  	// genMount "filestorage/torrents"
  	// genMount "filestorage/ps2smb";
  swapDevices = [ { device = "/dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S74ZNX0W302758N-part1"; } ];
  services.fstrim = {
    enable = true;
    interval = "05:00";
  };
}
