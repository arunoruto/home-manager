{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "python";
          language-servers = ["pyright" "ruff"];
          auto-format = true;
          formatter = {
            #command = "black";
            command = "ruff format";
            args = ["--line-length" "88" "--quiet" "-"];
          };
        }
      ];
      language-servers = {
        pyright.config.python.analysis.typeCheckingMode = "basic";
        ruff = {
          command = "ruff-lsp";
          config.settings.args = ["--ignore" "E501"];
        };
      };
    };
    extraPackages = with pkgs; [
      pyright
      ruff
      black
    ];
  };
}
