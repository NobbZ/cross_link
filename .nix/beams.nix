pkgs: let
  beamPkgs = with pkgs.beam_nox; packagesWith interpreters.erlangR25;
  erlang = beamPkgs.erlang;
  elixir = beamPkgs.elixir_1_14;
in {inherit erlang elixir;}
