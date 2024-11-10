{pkgs, ...}: {
  enable = true;
  package = pkgs.firefox.override {
    cfg = {
      enableGnomeExtensions = true;
    };
  };
}
