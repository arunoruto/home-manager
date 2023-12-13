Create a `user.nix` file with the following content:
```nix
{ config, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "<username>";
  home.homeDirectory = "/home/<username>";

}
```
