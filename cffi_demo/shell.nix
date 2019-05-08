{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "Futhark";
    buildInputs = [
        futhark
        glibcLocales
        (python37.withPackages(ps: with ps; [
            cffi
            flake8
            imageio
            pip
        ]))
    ];
    shellHook = ''
        . .shellhook
    '';
}