{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "substitute";
        src = builtins.fetchGit {
          url = "https://github.com/gbprod/substitute.nvim";
          ref = "main";
        };
      })
    ];
    keymaps = [
      { mode ="n"; key = "s";  action = ''require("substitute").operator''; lua = true; options.desc = "Substitute with motion"; }
      { mode ="n"; key = "ss"; action = ''require("substitute").line'';     lua = true; options.desc = "Substitute line"; }
      { mode ="n"; key = "S";  action = ''require("substitute").eol'';      lua = true; options.desc = "Substitute to end of line"; }
      { mode ="x"; key = "s";  action = ''require("substitute").visual'';   lua = true; options.desc = "Substitute in visual mode"; }
    ];
  };
}
