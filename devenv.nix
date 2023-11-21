{ lib, pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";
  env.LD_LIBRARY_PATH = "${lib.makeLibraryPath [ pkgs.avahi-compat ]}";

  # https://devenv.sh/packages/
  packages = with pkgs; [ avahi-compat libimobiledevice ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/languages/
  languages.python.enable = true;
  languages.python.venv.requirements = "requests\n";
  languages.python.venv.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
