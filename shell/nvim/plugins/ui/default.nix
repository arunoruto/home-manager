{
  imports = [
    ./noice.nix
    ./alpha.nix
    ./lualine.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
  };
}
