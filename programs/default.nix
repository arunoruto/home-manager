{ ... }:
{
  imports = [
    #./programs/vim.nix
    ./nvim
    ./git.nix
    ./newsboat.nix
    ./python.nix
    ./terminal
  ];
}
