{
  description = "cdub3 does darwin";
  # where stuff comes from
  inputs = {
    # the main monorepo containing instructions for installing pieces of software ('derivations' in nix speak)
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-22.11

    # home directory configuration management
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # controller of system level software. deepest level type
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # we try not to but sometimes have to brew
    homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # my own damn neovim
    monkvim.url = "github:criswit/nvim";
    monkvim.inputs.nixpkgs.follows = "nixpkgs";

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };
  # where stuff goes to
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    monkvim,
    homebrew,
    vscode-extensions,
    ...
  }: let
    config = import ./config.nix;
  in {
    darwinConfigurations = {
      "${config.hostname}" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = import nixpkgs {
          system = "x86_64-darwin";
          config.allowUnfree = true;
        };
        modules = [
          ./modules/darwin
          homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "${config.username}";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {inherit monkvim;};
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${config.username}.imports = [
                ./modules/home-manager
              ];
            };
          }
        ];
      };
    };
  };
}
