{pkgs, ...}: let
  config = import ../../config.nix;
in {
  users.users.${config.username} = {
    name = "${config.name}";
    home = "/Users/${config.username}";
  };
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    # packages added here are installed under system context.
    systemPackages = with pkgs; [
      neovim
      awscli
      ripgrep
    ];
  };
  services = {
    nix-daemon.enable = true;
  };
  system = {
    stateVersion = 4;
    defaults = {
      finder.AppleShowAllExtensions = true;
      finder._FXShowPosixPathInTitle = true;
      dock.autohide = true;
      NSGlobalDomain.AppleShowAllExtensions = true;
      NSGlobalDomain.InitialKeyRepeat = 14;
      NSGlobalDomain.KeyRepeat = 1;
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";

  environment.systemPackages = [
    pkgs.neovim
  ];

  homebrew = {
    enable = true;
    taps = [];
    brews = [];
    casks = [];
    masApps = {};
    onActivation = {
      cleanup = "zap"; # https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix#L62
    };
  };

  fonts.packages = [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
