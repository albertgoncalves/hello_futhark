#!/usr/bin/env python3

from os import environ

from mandelbrot import mandelbrot
from matplotlib.image import imsave
from numpy import empty, reshape


def main():
    m = mandelbrot()
    filename = "{}/out/mandelbrot.png".format(environ["WD"])
    scale = 3
    params = \
        { "width": 150 * scale
        , "height": 300 * scale
        , "limit": 255
        , "minX": -2.23
        , "minY": -1.15
        , "maxX": 0.83
        , "maxY": 1.15
        }
    fut_image = m.main(*params.values()).get()
    image = empty((params["height"], params["width"], 3))
    image[:, :, 0] = (fut_image & 0xFF0000) >> 16
    image[:, :, 1] = (fut_image & 0xFF00) >> 8
    image[:, :, 2] = (fut_image & 0xFF)
    image = reshape(image, (params["height"], params["width"] * 3))
    imsave(filename, image)


if __name__ == "__main__":
    main()
