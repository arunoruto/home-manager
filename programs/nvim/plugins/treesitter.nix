{ ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = "all";
        disabledLanguages = [
          "latex"
        ];
        indent = true;
        incrementalSelection = {
          enable = true;
          keymaps = {
            initSelection = "<C-space>";
            nodeIncremental = "<C-space>";
            scopeIncremental = false;
            nodeDecremental = "<bs>";
          };
        };
      };
    };
  };

}
