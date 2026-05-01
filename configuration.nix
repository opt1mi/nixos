# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 2;

  networking.hostName = "optinix";

  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  nixpkgs.config.allowUnfree = true;

  services.displayManager.ly.enable = true;
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "de";
    windowManager.i3.enable = true;
  };

  users.users.optimi = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      firefox
      alacritty
      git
      btop
      rofi
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    nixd
  ];

  system.stateVersion = "25.11";

}
