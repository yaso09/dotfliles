# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.sessionVariables = {
    # If your cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
};
  networking.hostName = "Nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.wireless.userControlled.enable = true;
  # networking.wireless.networks.SUPERONLINE_WiFi_4012.pskRaw = "14104750c927d942f65d41fb90a8a62b2c14a027cc1dcf43123228265508a3f1";
  # networking.wireless.interfaces = ["wlp0s20f3"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    displayManager.sddm.enable = true;
    enable = true;
    layout = "tr";
    windowManager.hypr.enable = true;
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "trq";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.proto = {
    isNormalUser = true;
    description = "proto";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "proto";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   firefox
   kitty
   jetbrains.pycharm-community
   steam
   webcord
   prismlauncher
   libsForQt5.kdenlive
   obs-studio
   vlc
   nvtop
   neofetch
   htop
   razergenie
   bitwarden
   hyprpaper
   hyprpicker
   libsForQt5.dolphin
   rofi
   qt5ct
   gnome.gnome-disk-utility
   waybar
   dunst
   pavucontrol
   dunst
   grim
   slurp
   hyprpicker
   wl-clipboard
   jp
   libsForQt5.gwenview
   libnotify
   home-manager
   libsForQt5.polkit-qt
   libsForQt5.polkit-kde-agent
   networkmanagerapplet
   git
   cmake
   unzip
   libsForQt5.ark
];

  # unstable packages
let
  unstable = import
    (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/<branch or commit>)
             reuse the current configuration
    { config = config.nixpkgs.config; };
in
{
 environment.systemPackages = with pkgs; [
    nwg-look
  ];
}

  # hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.xwayland.hidpi = true;
  programs.xwayland.enable = true;
hardware = {
    # Opengl
    opengl.enable = true;
};
 
  # litterally bashrc
environment.interactiveShellInit = "neofetch";

# Enable sound with pipewire.
#sound.enable = true;
#security.rtkit.enable = true;
#services.pipewire = {
 # enable = true;
  #alsa.enable = true;
  #alsa.support32Bit = true;
  #pulse.enable = true;
  #jack.enable = true;
#};

  # pulseaudio
  hardware.pulseaudio.enable = true;

  # XDG portal
 xdg.portal.enable = true;
 xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
   system.stateVersion = "23.05"; # Did you read the comment?

}

