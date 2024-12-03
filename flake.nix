{
  description = "Neovim flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "nix-community/home-manager"; 
    # You can add other inputs here if required (like plugins or dependencies).
  };

  outputs = { ... }: {
    homeModules = {
      neovim = ./default.nix;
    };
  };
}
