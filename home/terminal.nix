{ pkgs, ... }:

{
    home.packages = with pkgs; [
        fastfetch
        btop
        bat
        xclip
        tealdeer
        vim
	yazi
        ghostty
        wget
        jq
        git
    ];

}
