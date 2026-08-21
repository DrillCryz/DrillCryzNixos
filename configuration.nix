
	##################################
	##	Por ordenar aun xd	##
	##################################

{ config, pkgs, ... }:

	#######################
	##      Imports      ##
	#######################

{
  imports =
    [
      ./hardware-configuration.nix
      ./extra-config.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

	#######################
	##      SwapRam      ##
	#######################

    zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  swapDevices = [
  { device = "/swapfile"; }
];

	#######################
	##      Network      ##
	#######################

  networking.hostName = "DrillCryz";

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Santiago";

  i18n.defaultLocale = "es_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

   services.xserver.enable = true;

   services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
        user = "greeter";
      };
    };
  };

  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  services.printing.enable = true;

	####################
	##      User      ##
	####################

  users.users."hax" = {
    isNormalUser = true;
    description = "DrillCryz";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      tree
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";

    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
  };

	############################
	##      Aplicaciones      ##
	############################

  environment.systemPackages = with pkgs; [
    nautilus
    librsvg
    glycin-loaders
    xwayland-satellite
    brightnessctl
    keyd
    tuigreet
    upower
    acpi
    lm_sensors
    papirus-icon-theme
  ];

	##      (de nautilus)      ##
  xdg.mime.defaultApplications = {
    "inode/directory" = "org.gnome.Nautilus.desktop";
  };

	#######################
	##      Fuentes      ##
	#######################

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    dina-font
    proggyfonts
    comic-neue
    corefonts
];

    programs.niri.enable = true;
    programs.fish.enable = true;

    services.flatpak.enable = true;

    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    hardware.sensor.iio.enable = true;
    hardware.opentabletdriver.enable = true;

    programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;

      extraPortals = [
	pkgs.xdg-desktop-portal-gtk
      ];

      config.niri = {
	"org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
 };

    services.keyd = {
	enable = true;
	keyboards.default = {
	  settings = {
	    main = {
	      leftmeta = "overload(meta, M-S-o)";
      };
     };
    };
   };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
};
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ mesa ];
};

	#######################
	##      Version      ##
	#######################

  system.stateVersion = "26.05";

}
