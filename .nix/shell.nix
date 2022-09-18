{
  elixir,
  erlang,
  glibcLocales,
  inotify-tools,
  lib,
  mkShell,
  nil,
  stdenv,
  yamlfmt,
}: let
  inherit (lib) optionalAttrs;
  inherit (stdenv) isLinux;
in
  mkShell {
    packages = [
      # Actually developing elixir/phoenix
      elixir
      inotify-tools
      # auxiliary tooling for auxiliary files
      nil
      yamlfmt
    ];

    LANG = "en_US.UTF-8";

    ERL_INCLUDE_PATH = "${erlang}/lib/erlang/usr/include";
  }
  // optionalAttrs isLinux {
    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
  }
