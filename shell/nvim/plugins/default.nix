{pkgs, ...}: {
  imports = [
    ./completion
    ./notes
    ./lsp
    ./research
    ./ui
    ./utils
    ./auto-session.nix
    ./git.nix
    ./nvim-tree.nix
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
      #startup-nvim.enable = true;
      tmux-navigator.enable = true;
      # https://ejmastnak.com/tutorials/vim-latex/vimscript/
      vimtex.enable = true;
      nix.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      cheatsheet-nvim
      plenary-nvim # User by many plugins as dependency
    ];
  };
}
