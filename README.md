# Install on non NixOS system
Follow the steps on the [official nix](https://nixos.org/download/) website. Multi-user is prefered!

Afterwards, home-manager needs to be installed. But before that, some directory changes have to be done:
```sh
sudo chown $USER:nixbld /nix/var/nix/{profiles,gcroots}/per-user/$USER
```

Now home-manager can be installed using the following command:
```sh
nix-shell '<home-manager>' -A install
```

Further information can be found at the [home-manager installation docs](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone).
