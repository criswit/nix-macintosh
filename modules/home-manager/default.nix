{
  pkgs,
  monkvim,
  vscode-extensions,
  ...
}: let
  config = import ../../config.nix;
in {
  programs.home-manager.enable = true;
  home = {
    username = "${config.username}";
    homeDirectory = "/Users/${config.username}";
    stateVersion = "24.11";
    packages = with pkgs; [
      monkvim.packages."x86_64-darwin".default
    ];
    file = {
      ".wezterm.lua".text = builtins.readFile ./.wezterm.lua;
    };
  };

  # https://github.com/nix-community/home-manager/tree/master/modules/programs
  programs = {
    # nix is saying firefox is not available on the requested host platform
    #firefox = import ./programs/firefox.nix {inherit pkgs;};
    zsh = import ./programs/zsh.nix {inherit pkgs;};
    starship = import ./programs/starship.nix {inherit pkgs;};
    vscode = import ./programs/vscode.nix {
      inherit pkgs;
      inherit vscode-extensions;
    };
    #alacritty = import ./programs/alacritty.nix {inherit pkgs;};
  };
}
