{ pkgs, ... }:

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
