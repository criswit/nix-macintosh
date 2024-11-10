##  To install

* Run `darwin-rebuild switch` against the current flake to install. 

```
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix-macintosh/#maccitybitch
```


## To apply configuration changes

* Run `darwin-rebuild switch` using the shorthand , since having installed the flake it will be in your path.

```
darwin-rebuild switch --flake ~/nix-macintosh/#maccitybitch 
```