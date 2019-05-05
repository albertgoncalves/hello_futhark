{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "Futhark";
    buildInputs = [
        futhark
    ];
    shellHook = ''
        . .conda
        . .shellhook
    '';
}
