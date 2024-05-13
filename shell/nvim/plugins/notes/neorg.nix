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
    extraLuaPackages = with pkgs.luaPackages; [
      lua-utils-nvim
      nvim-nio
      pathlib-nvim
    ];
    # extraLuaPackages = luaPkgs:
    #   with luaPkgs; [
    #     lua-utils-nvim
    #     nvim-nio
    #     pathlib-nvim
    #   ];
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "lua-utils";
    #     src = builtins.fetchGit {
    #       url = "https://github.com/nvim-neorg/lua-utils.nvim";
    #       ref = "main";
    #     };
    #   })
    # ];
  };
}
