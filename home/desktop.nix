{ pkgs, ... }:

{
    home.packages = with pkgs; [
];

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}	
