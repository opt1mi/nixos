{ config, pkgs, ... }:

{
  home.username = "optimi";
  home.homeDirectory = "/home/optimi";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos-dots#optinix";
    };
  };
  home.file.".config/i3".source = ./config/i3;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    zed-editor
    discord
    yazi
    unzip
    zip
    noriskclient-launcher
    obs-studio
    fastfetch
    prismlauncher
    freecad
    jp2a
    kdePackages.kdenlive
  ];

}
