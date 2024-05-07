{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "hlchunk";
        src = builtins.fetchGit {
          url = "https://github.com/shellRaining/hlchunk.nvim";
          ref = "main";
        };
      })
    ];
  };
}
