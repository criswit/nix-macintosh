{pkgs, ...}: {
  enable = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  shellGlobalAliases = {
    g = "git";
    nix-rebuild = "darwin-rebuild switch --flake ~/nix-macintosh/#maccitybitch";
  };
  plugins = with pkgs; [
    {
      name = "vi-mode";
      src = zsh-vi-mode;
      file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
  ];
  initExtraFirst = ''
    export PATH="/opt/homebrew:$PATH"
  '';
}
