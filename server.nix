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
    vivid

    # zsh-autosuggestions
    # zsh-syntax-highlighting
  ];
}
