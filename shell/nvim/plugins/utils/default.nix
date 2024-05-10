{
  imports = [
    ./actions-preview.nix
    ./comment.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
  };
}
