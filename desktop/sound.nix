{
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    config = {
      pipewire.resample.quality = 10;
      pipewire-pulse.resample.quality = 10;
    };
  };
}
