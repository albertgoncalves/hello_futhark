{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "Futhark";
    buildInputs = [
        (python37.withPackages(ps: with ps; [
            conda
        ]))
        futhark
        glibcLocales
        shellcheck
    ];
    shellHook = ''
        . .conda
        . .pkg
        . .shellhook
    '';
}
