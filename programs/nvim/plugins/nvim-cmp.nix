{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      nvim-autopairs = {
        enable = true;
        checkTs = true;
        #tsConfig = {
        #  lua = [ "string" ];
        #  javascript = [ "template_string" ];
        #};
      };
      cmp-nvim-lsp.enable = true;
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        #settings = {
        #  completion.completeopt = "menu,menuone,preview,noselect";
        #  snippet.expand = ''
        #    function(args)
        #      require('luasnip').lsp_expand(args.body)
        #    end
        #  '';
        #};
        completion.completeopt = "menu,menuone,preview,noselect";
        snippet.expand = {
            __raw = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";           # previous suggestion
          "<C-j>" = "cmp.mapping.select_next_item()";           # next suggestion
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>"  = "cmp.mapping.confirm({ select = false })";  # close completion window
          "<C-Space>" = "cmp.mapping.complete()";               # show completion suggestions
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        formatting.format = ''
          require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          })
        '';
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      cmp-buffer          # source for text in buffer
      cmp-path            # source for file system paths
      luasnip             # for snippets
      cmp_luasnip         # for autocompletion
      friendly-snippets   # useful snippets
      lspkind-nvim        # vs-code like pictograms
      cmp-nvim-lsp
    ];
    extraConfigLua = ''
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    '';
  };
}
