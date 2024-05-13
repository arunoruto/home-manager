{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      neorg = {
        enable = true;
        modules = {
          "core.defaults".__empty = null;
          "core.concealer" = {
            config = {
              icon_preset = "basic";
            };
          };
          "core.dirman" = {
            config = {
              workspaces = {
                notes = "~/Documents/notes";
              };
              default_workspace = "notes";
            };
          };
        };
      };
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "lua-utils";
        src = builtins.fetchGit {
          url = "https://github.com/nvim-neorg/lua-utils.nvim";
          ref = "main";
        };
      })
    ];
  };
}
