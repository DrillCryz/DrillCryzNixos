{ pkgs, ... }:

{
    home.packages = with pkgs; [
        fastfetch
        btop
        bat
        xclip
        tealdeer
        vim
        ghostty
        wget
        jq
        git
    ];

}
