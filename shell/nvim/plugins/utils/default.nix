{
  imports = [
    ./actions-preview.nix
    ./comment.nix
    ./hardtime.nix
    ./indent-blankline.nix
    ./telescope.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
  };
}
