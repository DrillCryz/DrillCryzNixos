{ pkgs, ... }:

{
  imports = [
    ./terminal.nix
    ./art.nix
    ./recording.nix

    ];

  home.stateVersion = "25.11";

}
