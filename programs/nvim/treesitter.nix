{ ... }:
{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        disabledLanguages = [
          "latex"
        ];
      };
    };
  };

}
