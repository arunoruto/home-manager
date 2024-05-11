{
  imports = [
    ./actions-preview.nix
    ./comment.nix
    ./hardtime.nix
    ./telescope.nix
    ./which-key.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
  };
}
