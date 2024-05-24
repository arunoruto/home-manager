{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./shell
    ./programs
  ];

  home.packages = with pkgs; [
    speedtest-cli

    glow
    hugo
    julia
    miller
    vivid

    # zsh-autosuggestions
    # zsh-syntax-highlighting
  ];
}
