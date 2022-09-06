pkgs: let
  beamPkgs = with pkgs.beam_nox; packagesWith interpreters.erlangR25;
  erlang = beamPkgs.erlang;
  elixir = beamPkgs.elixir_1_13.overrideAttrs (oa: rec {
    version = "1.14.0";
    src = pkgs.fetchFromGitHub {
      owner = "elixir-lang";
      repo = "elixir";
      rev = "v${version}";
      hash = "sha256-NJQ2unK7AeLGfaW/hVXm7yroweEfudKVUa216RUmLJs=";
    };
  });
in {inherit erlang elixir;}
