{
  programs.nixvim = {
    plugins = {
      nvim-autopairs = {
        enable = true;
        settings.checkTs = true;
        #tsConfig = {
        #  lua = [ "string" ];
        #  javascript = [ "template_string" ];
        #};
      };
    };
  };
}
