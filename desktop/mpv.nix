{
  environment.etc."mpv/mpv.conf" = {
    text = ''
      alang=ja,jpn,en,eng,ru,rus
      slang=ru,rus,en,eng
      vo=gpu
      profile=gpu-hq
      scale=ewa_lanczossharp
      hwdec=vdpau
      vf=vdpaupp=hqscaling:5
      ao=pipewire
      pipewire-buffer=native
      pipewire-volume-mode=channel
    '';
  };
}
