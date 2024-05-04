{ pkgs, ... }:
{
  imports = [
    ./alpha.nix
    ./auto-session.nix
    ./comment.nix
    ./formatting.nix
    ./git.nix
    ./nvim-cmp.nix
    ./nvim-tree.nix
    ./lualine.nix
    ./lsp.nix
    ./substitute.nix
    ./telescope.nix
    ./trouble.nix
    ./vim-maximizer.nix
  ];

  programs.nixvim = {
    plugins = {
      bufferline = {
        enable = true;
        mode = "tabs";
        separatorStyle = "slant";
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
      };
      #dressing.enable = true;
      indent-blankline = {
        enable = true;
        indent.char = "┊";
      };
      neogit.enable = true;
      surround.enable = true;
      which-key = {
        enable = true;
        registrations = {
          "<localLeader>l" = "+vimtex";
        };
      };
      #startup-nvim.enable = true;
      tmux-navigator.enable = true;
      # https://ejmastnak.com/tutorials/vim-latex/vimscript/
      vimtex.enable = true;
      nix.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      cheatsheet-nvim
    ];
  };
}
