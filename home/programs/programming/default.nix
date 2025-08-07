{
  pkgs,
  ...
}: let
  lua = [
    pkgs.lua51Packages.lua
    pkgs.lua51Packages.luarocks
  ];
in {
  home.packages = with pkgs;
    [
      nixd
      typescript
      go
    ]
    ++ lua;
}
