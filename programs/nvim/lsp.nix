{ ... }:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          #pyright.enable = true;
          ruff-lsp.enable = true;
          julials.enable = true;
          nixd.enable = true;
          texlab.enable = true;
        };
        #keymaps = {
        #  extra = [
        #    {
        #      action = "<plug>(vimtex-doc-package)";
        #      key = "<Leader>K";
        #      options = {
        #        desc = "Vimtex Docs";
        #        silent = true;
        #      };
        #    }
        #  ];
        #};
      };
    };
  };

}
