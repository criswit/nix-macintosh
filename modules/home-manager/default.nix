{pkgs, ...}: let
  config = import ../../config.nix;
in {
  programs.home-manager.enable = true;
  home = {
    username = "${config.username}";
    homeDirectory = "/Users/${config.username}";
    stateVersion = "24.11";
  };
  programs = {
    firefox = import ./programs/firefox.nix {inherit pkgs;};
    zsh = import ./programs/zsh.nix {inherit pkgs;};
  };
}
