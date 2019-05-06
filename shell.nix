{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "Futhark";
    buildInputs = [
        futhark
        glibcLocales
    ];
    shellHook = ''
        . .conda
        . .shellhook
    '';
}
