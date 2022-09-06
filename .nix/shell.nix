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
    packages = [elixir nil inotify-tools yamlfmt];

    LANG = "en_US.UTF-8";

    ERL_INCLUDE_PATH = "${erlang}/lib/erlang/usr/include";
  }
  // optionalAttrs isLinux {
    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
  }
