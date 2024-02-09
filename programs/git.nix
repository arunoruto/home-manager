{ pkgs, ... }:
{
  home.packages = with pkgs; [
    glab # Gitlab CLI tool
  ];

  programs.git = {
    enable = true;
    userName  = "arunoruto";
    userEmail = "21687187+arunoruto@users.noreply.github.com";
    lfs.enable = true;
    includes = [{
      #condition = "gitdir:~/cloudseeds/**";
      contents = {
        init.defaultBranch = "main";
      };
    }];
    extraConfig = {
      "credential \"https://gitlab.com\"" = {
        helper = "${pkgs.glab}/bin/glab auth git-credential";
      };
      pull = {
        rebase = true;
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      git_protocol = "https";
      editor = "vim";
      prompt = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
    };
  };
}
