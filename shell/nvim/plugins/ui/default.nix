{pkgs, ...}: {
  imports = [
    ./alpha.nix
    ./baleia.nix
    ./lualine.nix
    ./noice.nix
  ];

  programs.nixvim = {
    plugins = {
      #nvim-ufo.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nui-nvim
    ];
  };
}
