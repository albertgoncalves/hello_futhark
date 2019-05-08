# Hello, Futhark!

Home for a few working examples of `Futhark` via `Python`.

Needed things
---
 * [Nix](https://nixos.org/nix/)

To get going
---
Unless you already have a `conda env` named `pycl`, simply entering the development environment with `$ nix-shell` should handle all the various dependencies. You should get a prompt from `conda` regarding `Python` package installation along the way.

If you _do_ have a `conda env` with such a name (and would prefer to keep it the way it is), head over to `.conda` and set `env=...` to whatever works best.

If everything went according to plan
---
```
$ nix-shell
```
```
(pycl)
[nix-shell:path/to/hello_futhark]$ bin/dotprod
32
44.375
```
```
(pycl)
[nix-shell:path/to/hello_futhark]$ bin/mandelbrot && open out/mandelbrot.png
```
<p align="center">
    <img width="450" height="300" src="cover.png">
</p>
