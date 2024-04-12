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
      };
    };
  };

}
