#!/usr/bin/env python3

from dotprod import dotprod
from numpy import array, int32


def main():
    f = dotprod()
    x = array([1, 2, 3], dtype=int32)
    y = array([4, 5, 6], dtype=int32)
    print(f.main(x, y))


if __name__ == "__main__":
    main()
