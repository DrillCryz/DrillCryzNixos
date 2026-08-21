{ pkgs, ... }:

{
    home.packages = with pkgs; [
	(wine.override { wineBuild = "wine64"; })
	vesktop
  ];
}

