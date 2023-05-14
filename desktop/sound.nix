{
  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  environment.etc."pipewire/client.conf" = {
    
  };
}
