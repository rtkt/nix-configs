{
  programs.htop.enable = true;
  programs.htop.settings = {
    sort_key = 46;
    sort_direction = -1;
    tree_sort_key = 0;
    tree_sort_direction = 1;
    hide_kernel_threads = 1;
    hide_userland_threads = 1;
    shadow_other_users = 0;
    shadow_distribution_path_prefix = 0;
    show_thread_names = 0;
    show_program_path = 1;
    highlight_base_name = 1;
    highlight_deleted_exe = 1;
    highlight_megabytes = 1;
    highlight_threads = 1;
    highlight_changes = 0;
    highlight_changes_delay_secs = 5;
    detailed_cpu_time = 0;
    degree_fahrenheit = 0;
    update_process_names = 0;
    color_scheme = 0;
    enable_mouse = 1;
    header_margin = 0;
    tree_view = 1;
    "screen:Main" = "PID USER PRIORITY NICE M_VIRT M_RESIDENT M_SHARE STATE PERCENT_CPU PERCENT_MEM TIME Command";
  };
}
