{ config, pkgs, ... }:

{
  home.username = "luca";
  home.homeDirectory = "/home/luca";

  programs = {
    git = import ./git.nix;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
    };
    tmux = import ./tmux.nix { inherit pkgs; };
    helix = import ./helix.nix { inherit pkgs; };
  };

  home.packages = with pkgs; [
    nodePackages_latest.typescript-language-server
    nodejs_22
    pnpm
    gh
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
