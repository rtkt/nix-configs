{config, ...}: {
  nix.distributedBuilds = true;
  nix.buildMachines = [
    {
      system = "x86_64-linux";
      sshUser = "connector";
      hostName = "localhost";
      speedFactor = 20;
      maxJobs = 10;
      supportedFeatures = [
        "kvm"
        "big-parallel"
        "benchmark"
      ];
    }
  ];
  environment.variables.NIX_SSHOPTS = "-A -p 50000 -i /root/.ssh/id_buildrequest";
  nix.settings = {
    builders-use-substitutes = true;
    max-jobs = 0;
  };
}
