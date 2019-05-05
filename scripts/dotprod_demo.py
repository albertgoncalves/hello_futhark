#!/usr/bin/env python3

from dotprod import dotprod
from numpy import array, float32, int32


def main():
    o = dotprod()
    x = [1.25, 2.5, 3.75]
    y = [4.25, 5.5, 6.75]
    for (f, t) in [(o.dotprodI32, int32), (o.dotprodF32, float32)]:
        print(f(array(x, dtype=t), array(y, dtype=t)))


if __name__ == "__main__":
    main()
