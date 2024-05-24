{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    settings = {
      plugin = {
        prepend_previewers = [
          {
            name = "*.md";
            run = "${pkgs.glow}/bin/glow";
          }
          {
            mime = "text/csv";
            run = "miller";
          }
        ];
      };
    };
  };
  home.file = {
    ".config/yazi/plugins/glow.yazi" = {
      recursive = true;
      source = pkgs.fetchFromGitHub {
        owner = "Reledia";
        repo = "glow.yazi";
        rev = "536185a4e60ac0adc11d238881e78678fdf084ff";
        hash = "sha256-NcMbYjek99XgWFlebU+8jv338Vk1hm5+oW5gwH+3ZbI=";
      };
    };
    ".config/yazi/plugins/miller.yazi" = {
      recursive = true;
      source = pkgs.fetchFromGitHub {
        owner = "Reledia";
        repo = "miller.yazi";
        rev = "75f00026a0425009edb6fedcfbe893f3d2ddedf4";
        hash = "sha256-u8xadj6/s16xXUAWGezYBqnygKaFMnRUsqtjMDr6DZA=";
      };
    };
  };
}
