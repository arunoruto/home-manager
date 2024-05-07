{
  imports = [
    #./headlines.nix
    ./neorg.nix
  ];

  programs.nixvim = {
    plugins = {
      markdown-preview.enable = true;
    };
  };
}
