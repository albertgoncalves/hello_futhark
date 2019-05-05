#!/usr/bin/env python3

from os import environ

from mandelbrot import mandelbrot
from matplotlib.image import imsave
from numpy import empty, reshape


def main():
    m = mandelbrot()
    filename = "{}/out/mandelbrot.png".format(environ["WD"])
    width = 300
    height = 600
    limit = 255
    minx = -2.23
    miny = -1.15
    maxx = 0.83
    maxy = 1.15
    fut_image = m.main(width, height, limit, minx, miny, maxx, maxy).get()
    image = empty((height, width, 3))
    image[:, :, 0] = (fut_image & 0xFF0000) >> 16
    image[:, :, 1] = (fut_image & 0xFF00) >> 8
    image[:, :, 2] = (fut_image & 0xFF)
    image = reshape(image, (height, width * 3))
    imsave(filename, image)


if __name__ == "__main__":
    main()
