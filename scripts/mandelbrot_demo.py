#!/usr/bin/env python3

from os import environ
from sys import argv

from mandelbrot import mandelbrot
from imageio import imwrite
from numpy import empty, uint8, reshape


def main():
    try:
        scale = int(argv[1])
    except:
        scale = 3
    f = mandelbrot()
    filename = "{}/out/mandelbrot.png".format(environ["WD"])
    params = \
        { "width": int(150 * scale)
        , "height": int(300 * scale)
        , "limit": 255
        , "minX": -2.23
        , "minY": -1.15
        , "maxX": 0.83
        , "maxY": 1.15
        }
    fut_image = f.main(*params.values()).get()
    image = empty((params["height"], params["width"], 3), dtype=uint8)
    image[:, :, 0] = (fut_image & 0xFF0000) >> 16
    image[:, :, 1] = (fut_image & 0xFF00) >> 8
    image[:, :, 2] = (fut_image & 0xFF)
    image = reshape(image, (params["height"], params["width"] * 3))
    imwrite(filename, image)


if __name__ == "__main__":
    main()
