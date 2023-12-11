{ ... }:
{
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
