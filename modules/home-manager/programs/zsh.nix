{pkgs, ...}: {
  enable = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  shellGlobalAliases = {
    g = "git";
  };
  plugins = with pkgs; [
    {
      name = "powerlevel10k";
      src = zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
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
