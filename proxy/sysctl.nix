{
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;

    # "net.core.netdev_max_backlog" = 262144;
    "net.core.rmem_default" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_default" = 1048576;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.core.somaxconn" = 8192;
    "net.ipv4.tcp_mem" = "25600 51200 102400";
    "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
    "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    # "net.ipv4.udp_rmem_min" = 8192;
    # "net.ipv4.udp_wmem_min" = 8192;
    "net.ipv4.tcp_fastopen" = 3;
    # "net.ipv4.tcp_slow_start_after_idle" = 0;
    # "net.ipv4.tcp_max_syn_backlog" = 8192;
    # "net.ipv4.tcp_max_tw_buckets" = 4096;
    # "net.ipv4.tcp_mtu_probing" = 1;
    # "net.core.default_qdisk" = "cake";
    "net.ipv4.tcp_congestion_control" = "bbr";
    # "net.ipv4.tcp_syncookies" = 1;
    # "net.ipv4.tcp_rfc1337" = 1;
    # "net.ipv4.tcp_tw_reuse" = 1;
    # "net.ipv4.tcp_fin_timeout" = 240;
    # "net.ipv4.conf.default.rp_filter" = 1;
    # "net.ipv4.conf.all.rp_filter" = 1;

    "kernel.sysrq" = 0;
    # "kernel.kprt.restrict" = 1;
    "kernel.yama.ptrace_scope" = 3;
    "kernel.kexec_load_disabled" = 1;
  };
}
