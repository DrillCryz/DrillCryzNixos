{ pkgs, ... }

	## Audio y cosas de audio y asi xd

{
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
}

	## Gaming y cosas de gaming y asi xd

{
    environment.systemPackages = with pkgs; [

      (pkgs.appimage-run.override {
        extraPkgs = pkgs: [
          pkgs.icu
       ];
     })
	protontricks
   ];
}
