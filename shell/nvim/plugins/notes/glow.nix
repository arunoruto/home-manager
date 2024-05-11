{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "glow";
        src = builtins.fetchGit {
          url = "https://github.com/ellisonleao/glow.nvim";
          ref = "main";
        };
      })
    ];
    extraConfigLua = ''
      require('glow').setup({
        glow_path = "${pkgs.glow}/bin/glow",
        width_ratio = 0.85,
        height_ratio = 0.85,
      })
    '';
  };
}
