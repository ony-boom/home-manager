{pkgs, ...}: let
  lua = [
    pkgs.lua
    pkgs.luarocks
  ];

  /* elixir = with pkgs; [
    gleam
    erlang
    rebar3
  ]; */
in {
  home.packages = with pkgs;
    [
      deno
    ]
    ++ lua;
    # ++ elixir;
}
