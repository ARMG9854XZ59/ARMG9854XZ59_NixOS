#

# NixOs GhostZ5M9_OS.

# Made and Modified by Alex Mahdi = ~ ARMG0268XZ59.

# Systems Configurations.

# Edit this configuration file to define what should be installed on

# your system. Help is available in the configuration.nix(5) man page, on

# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

#


{ config, lib, pkgs, ... }:


{

  imports =

    [

    # Include the results of the hardware scan.

      ./hardware-configuration.nix

    ];

  # imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix> ];


  # Boot Loaders.

  # Use the systemd-boot EFI boot loader.

  boot.loader.systemd-boot = {

    enable = true;

    editor = true;

  };

  boot.loader.efi.canTouchEfiVariables = true;

  # Use the Grub EFI Boot Loader.

  # boot.loader.grub = {

    # enable = true;

    # copyKernels = true;

    # version = 2;

    # efiInstallAsRemovable = true;

    # efiSupport = true;

    # fsIdentifier = "uuid";

    # splashMode = "stretch";

    # device = "nodev";

    # devices = ["/dev/nvme0n1"];

    # devices = [ "/dev/disk/by-uuid/3899-E60F" ];

    # device = "nodev";

    # extraEntries = ''

      # menuentry "Reboot" {

        # reboot

      # }

      # menuentry "Poweroff" {

        # halt

      # }

    # '';

    # useOSProber = true;

  # };

  # boot.loader.efi.canTouchEfiVariables = true;

  # Use the Refind EFI Boot Loader.

  # boot.loader.refind = {

    # enable = true;

    # copyKernels = true;

  # };

  # boot.loader.efi.canTouchEfiVariables = true;


  # Set Boot UEFI Mount.

  boot.loader.efi.efiSysMountPoint = "/boot/efi";


  # Supported FileSystems.

  boot.supportedFilesystems = [ "lvm2" "f2fs" ];

  # Use the LUKS2 Systems.

  boot.initrd.luks.devices = {

    "GhostZ5M9_OS" = {

      device = "/dev/disk/by-uuid/9523e025-11a2-43dd-853a-46ad183fadcf";

      preLVM = true;

    };

  };


  # Enable Plymouth.

  boot.plymouth = {

    enable = true;

    themePackages = with pkgs; [

      # plymouth (breeze-plymouth.override {

        # nixosBranding = true;

        # nixosVersion = config.system.nixosRelease;

      # })

      ];

      # theme = "plymouth-theme-bgrt";

      theme = "bgrt";

      # inputs.plymouth-theme-bgrt;

  };


  # Use the SystemD initrd.

  boot.initrd.systemd = {

    enable = true;

    tpm2 = {

      enable = true;

    };

  };


  # Systems Security.

  security = {

    tpm2 = {

      enable = true;

    };

  };


  # Kernel Modules and Firmware.

  boot.kernelModules = [ "intel_agp" "i915" ];

  hardware.enableAllFirmware = true;


  # Kernel Parameters.

  boot.kernelParams = [

  # splash

  # rhgb

  "i915.enable_guc=2"

  "i915.enable_fbc=1"

  "i915.enable_psr=1"

  "intel_idle.max_cstate=9"

  "pcie_aspm=force"

  # "i915.enable_guc=9"

  ];


  # Use different Systems Kernels.

  # boot.kernelPackages = pkgs.linuxPackages_xanmod;

  boot.kernelPackages = pkgs.linuxPackages_zen;


  # Systems Networking.

  # networking.networkmanager.enable = true;


  # Systems Drivers.

  # Graphics Drivers.

  # Enable Intel Graphics Acceleration.

  # services.xserver.videoDrivers = [ "i915" ];

  # hardware.opengl = {

    # enable = true;

    # driSupport = true;

    # driSupport32Bit = true";

  # };

  # Enable Hardware Acceleration for Video Playback

  # Enable GPU Vulkan Support.

  # extraPackages = with pkgs; [

  # intel-media-Drivers

  # vaapiIntel

  # vaapiVdpau

  # libvdpau-va-gl

  # vulkan-loader

  # vulkan-validation-layers

  # vulkan-tools

  # ];


  # Enable Bluetooth.

  hardware.bluetooth = {

    enable = true;

    settings = {

      General = {

        Enable = "Source, Sink, Media, Sokcet";

      };

    };

  };


  # Enable Power Management for better Battery Life.

  # services.tlp.enable = true;

  powerManagement.enable = true;


  # Enable Steam and Proton.

  # programs.steam = [

    # enable = true

    # remotePlay.openFirewall = true;

    # dedicatedServer.openFirewall = true;

    # localNetworkGameTransfers.openFirewall = true;

    # "extraCompatPackages = with pkgs; [ proton-ge dxvk ];"

  # ];


  # Define hostname.

  networking.hostName = "armg0268xz59";

  # networking.useDHCP = true;


  # Pick only one of the below networking options.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.


  # Set your time zone.

  time.timeZone = "Europe/London";


  # Configure network proxy if necessary

  # networking.proxy.default = "http://user:password@proxy:port/";

  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Select internationalisation properties.

  # i18n.defaultLocale = "en_US.UTF-8";

  # console = {

  #   font = "Lat2-Terminus16";

  #   keyMap = "us";

  #   useXkbConfig = true; # use xkb.options in tty.

  # };


  # Enable the X11 windowing system.

  # services.xserver.enable = true;

  
  # Configure keymap in X11

  # services.xserver.xkb.layout = "us";

  # services.xserver.xkb.options = "eurosign:e,caps:escape";


  # Enable CUPS to print documents.

  services.printing.enable = true;


  # Enable sound.

  # sound.enable = true;

  # hardware.pulseaudio.enable = true;

  # OR

  services.pipewire = {

    enable = true;

    alsa.enable = true;

    # alsa.support32bit = true;

    pulse.enable = true;

  };


  # Enable touchpad support (enabled default in most desktopManager).

  services.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.armg0268xz59 = {

    isNormalUser = true;

    createHome = true;

    # Enable ‘sudo’ for the user.

    extraGroups = [ "wheel" "armg0268xz59" "specials" "networkmanager" "audio" "video" "adb" "kvm" ];

    packages = with pkgs; [

      tree

    ];

    # security.sudo.enable = true;

    # security.sudo.wheelNeedsPassword = false;

  };


  # programs.firefox.enable = true;

  programs.hyprland.enable = true;


  # Systems Software.

  # List packages installed in system profile. To search, run:

  # $ nix search wget

  # environment.systemPackages = with pkgs; [

  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

  #   vim

  #   wget

  # ];

  environment.systemPackages = with pkgs; [

  gpm

  terminus_font

  tmux

  dvtm

  efibootmgr

  fwupd

  neovim

  nano

  micro

  emacs

  ghostty

  zsh

  mosh

  inxi

  lshw

  gimp

  btop

  mlocate

  # bpytop

  # home-desktopManager

  lm_sensors

  # lspci

  plymouth

  # plymouth-themes

  libsForQt5.qt5ct

  # libsForQt6.qt6ct

  qt6ct

  # qt5ctl

  # qt6ctl

  # layer-shell-qt5

  # layer-shell-qt6

  protonup-qt

  bottles

  neofetch

  fastfetch

  swww

  mpvpaper

  wofi

  rofi

  ags

  lolcat

  bat

  figlet

  toilet

  dialog

  # whiptail

  wget

  curl

  git

  htop

  btop

  mesa

  mesa-demos

  steam

  wine

  wine64

  wine-staging

  wineWowPackages.stable

  wineWowPackages.staging

  wineWowPackages.waylandFull

  # wine-ge

  ( wine.override { wineBuild = "wine64"; } )

  winetricks

  protontricks

  dxvk

  # vk3d

  xwaylandvideobridge

  sddm

  sddm-astronaut

  elegant-sddm

  sddm-sugar-dark

  sddm-kcm

  # sddm-wrapped

  # kdePackages.plasma-desktopManager

  # kdePackages.plasma-workspace

  # kdePackages.plasma-konsole

  # kdePackages.plasma-dolphin

  # plasma6

  # plasma

  # plasma-desktopManager

  plasma-workspace

  # kdeconnect

  konsole

  dolphin

  kwin

  # john-unstable

  # unstable.asusctl

  # unstable.qidi-slicer-bin

  wireguard-tools

  brightnessctl

  pavucontrol

  xclip

  xsel

  powertop

  tlp

  # tlp_rdw

  lemurs

  xdg-desktop-portal-kde

  xdg-desktop-portal-hyprland

  waybar

  waypaper

  hyprland

  chntpw

  nmap

  wireshark

  aircrack-ng

  # john

  hashcat

  hydra

  metasploit

  sqlmap

  gobuster

  burpsuite

  tor

  wpscan

  nikto

  bettercap

  zmap

  dirb

  ];


  # Variables Editor.

  environment.variables.EDITOR = "emacs";


  # Some programs need SUID wrappers, can be configured further or are

  # started in user sessions.

  # programs.mtr.enable = true;

  # programs.gnupg.agent = {

  #   enable = true;

  #   enableSSHSupport = true;

  # };


  programs.kdeconnect.enable = true;


  hardware.graphics = {

    enable = true;

  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  services.openssh = {

    enable = true;

   };


    i18n = {

    supportedLocales = [ "en_GB.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];


    defaultLocale = "en_GB.UTF-8";

    };


  console = {

    font = "ter-v12n";

    keyMap = "uk";

    packages = [ pkgs.terminus_font ];

    # useXkbConfig = true;

  };


  fonts.packages = with pkgs; [ terminus_font ];


  # packages = [

    # pkgs.gpm

  # ;


  services = {

    gpm = {

      enable = true;

      # device = "/dev/input/mice";

      # options = {

        # device = "/dev/input/mice";

        # mapname = "gpm";

        # timeout = "12";

      # };

    };

    blueman = {

      enable = true;

    };

    xserver = {

      enable = true;

      xkb.layout = "gb";

      xkb.model = "pc105";

      xkb.options = "terminate:ctrl_alt_bksp,eurosign:e,lv3:ralt_alt";

      xkb.variant = "";

      videoDrivers = [ "modesetting" ];

      # wayland = {

        # enable = true;

      # };

      displayManager = {

        # wayland = {

          # enable = true;

        # };

        # plasma6 = {

          # enable = true;

        # };

      };

    };

    displayManager = {

      enable = true;

      defaultSession = "plasma";

      sddm = {

        enable = true;

        wayland = {

          enable = true;

        };

        # plasma6 = {

          # enable = true;

        # };

        # package = {

          # sddm

          # pkgs.sddm.override { withQt6 = true; };

          # pkgs.sddm.overrideAttrs = (oldAttrs: { buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.qt6.qtbase ]; }# );

        # };

        package = lib.mkForce pkgs.kdePackages.sddm;

        # package = lib.mkForce sddm;

        theme = "maldives";

      };

    };

    desktopManager = {

      plasma6 = {

        enable = true;

      };

    };

  };


  # Enable Programs.

  programs = {

    adb = {

      enable = true;
    	
    };
  	
  };

  # Add users to specific groups.

  # users = {

    # groups = {

      # adbusers = {};

      # kvm = {};

    # };

    # users = {

      # armg0268xz59 = {

        # extragroups = [ "adbusers" "kvm" ];

      # };
    	
    # };
  	
  # };


  # Open ports in the firewall.

  # networking.firewall.allowedTCPPorts = [ ... ];

  # networking.firewall.allowedUDPPorts = [ ... ];

  # Or disable the firewall altogether.

  # networking.firewall.enable = false;


  # Copy the NixOS configuration file and link it from the resulting system

  # (/run/current-system/configuration.nix). This is useful in case you

  # accidentally delete configuration.nix.

  # system.copySystemConfiguration = true;


  # Enable NixOS Nix Flakes.

  nix.settings.experimental-features =  [ "nix-command" "flakes" ];


  nixpkgs.config.allowUnfree = true;



  # This option defines the first version of NixOS you have installed on this particular machine,

  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.

  #

  # Most users should NEVER change this value after the initial install, for any reason,

  # even if you've upgraded your system to a new NixOS release.

  #

  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,

  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how

  # to actually do that.

  #

  # This value being lower than the current NixOS release does NOT mean your system is

  # out of date, out of support, or vulnerable.

  #

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,

  # and migrated your data accordingly.

  #

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .

  system.stateVersion = "24.11"; # Did you read the comment?


}

