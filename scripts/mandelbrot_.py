#!/usr/bin/env python3

from os import environ
from sys import argv
from time import time

from mandelbrot import mandelbrot
from imageio import imwrite
from numpy import empty, uint8, reshape


def timer(f, s):
    start = time()
    x = f()
    print("{:17} {:.6f}s".format(s, time() - start))
    return x


def main():
    try:
        scale = int(argv[1])
    except:
        scale = 3
    filename = "{}/out/mandelbrot.png".format(environ["WD"])
    xs = {
        "width": int(150 * scale),
        "height": int(300 * scale),
        "limit": 255,
        "minX": -2.23,
        "minY": -1.15,
        "maxX": 0.83,
        "maxY": 1.15,
    }
    f = timer(lambda: mandelbrot(), "mandelbrot()")
    y = timer(lambda: f.main(*xs.values()).get(), "f.main(...).get()")
    image = empty((xs["height"], xs["width"], 3), dtype=uint8)
    image[:, :, 0] = (y & 0xFF0000) >> 16
    image[:, :, 1] = (y & 0xFF00) >> 8
    image[:, :, 2] = (y & 0xFF)
    image = timer(
        lambda: reshape(image, (xs["height"], xs["width"] * 3)),
        "reshape(...)",
    )
    timer(lambda: imwrite(filename, image), "imwrite(...)")


if __name__ == "__main__":
    main()
