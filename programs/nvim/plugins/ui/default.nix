{
  imports = [
    ./noice.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
  };
}
