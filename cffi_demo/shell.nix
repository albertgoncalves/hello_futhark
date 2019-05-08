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
        ]))
        opencl-headers_1_2
        ocl-icd-oclh_1_2
        opencl-info
    ];
    shellHook = ''
        . .shellhook
    '';
}
