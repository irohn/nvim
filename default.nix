{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      ripgrep
      fd
      nodejs
      cargo
      unzip
      make
      gcc
    ];
    file = {
      # neovim's config
      ".config/nvim" = {
        source = ".";
        recursive = true;
      };
    };
  };
  programs = {
    neovim = {
      package = pkgs.neovim-unwrapped;
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}
