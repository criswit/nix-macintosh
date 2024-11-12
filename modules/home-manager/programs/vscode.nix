{pkgs, ...}: {
  enable = true;
  # https://search.nixos.org/packages?type=packages&query=vscode-extensions
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    yzhang.markdown-all-in-one
  ];
}
