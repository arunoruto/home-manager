{ ... }:
{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        # https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
        formattersByFt = {
          python = [ "ruff_fix" "ruff_format" ];
          nix = [ "nixfmt" ];
          "_" = [ "trim_whitespace" ];
        };
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 1000;
        };
      };
    };
    keymaps = [
      { mode = [ "n" "v" ]; key = "<leader>mp"; action = ''function() require("conform").format({lsp_fallback = true, async = false, timeout_ms = 1000}) end''; lua = true; options = { silent = true; desc = "Format file or range (in visual mode)"; }; }
    ];
  };

}
