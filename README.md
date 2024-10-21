# Usage
```nix
{
  inputs = {
    # or your preferred NixOS channel
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    applegamer22.url = "github:AppleGamer22/nur";
  };
  outputs = { nixpkgs }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs = import nixpkgs {
          # ...
          overlays = [
            (final: prev: {
              # ...
              ag22 = applegamer22.packages."${system}";
            })
          ];
        };
      };
      modules = [
        # or in a separate Nix file
        ({ pkgs, ... }: {
          programs.nix-ld.enable = true;
          environment.systemPackages = with pkgs; [
            ag22.cocainate
          ];
        })
        # ...
      ];
    };
  };
}
```
