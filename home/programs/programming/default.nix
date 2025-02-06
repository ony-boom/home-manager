{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  javascript = [
    pkgs.deno
    pkgs.nodejs
  ];

  elmLang = with pkgs.elmPackages; [
    elm
    elm-test
    elm-format
  ];

  zig = [
    pkgs.zig
  ];
in {
  imports = [
    ./rust
  ];
  home.packages = with pkgs;
    [
      bun
      typescript
      jdk
    ]
    ++ javascript
    ++ lua
    ++ zig
    ++ elmLang;
}
