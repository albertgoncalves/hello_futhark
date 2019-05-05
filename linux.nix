{ pkgs ? import <nixpkgs> {} }:
with pkgs; mkShell {
    name = "Futhark";
    buildInputs = [
        futhark
        (python37.withPackages(ps: with ps; [
            flake8
            numpy
            pyopencl
        ]))
    ];
    shellHook = ''
        . .shellhook
    '';
}
