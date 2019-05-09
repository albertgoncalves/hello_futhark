#!/usr/bin/env python3

from toys import toys
from numpy import arange, float32, int8, int32, uint64


def main():
    f = toys()
    xs = \
        [ f.test1(float32(5))
        , f.test2(arange(5, dtype=int32))
        , f.test3(arange(5, dtype=int32)).get()
        , f.test4(5, 6)
        , f.test5(arange(9, dtype=uint64).reshape(3, 3)).get()
        , list(map(lambda x: x.get(), f.test6(int8(10))))
        , f.test7(False)
        , f.test8(arange(5, dtype=int32))
        ]
    for x in xs:
        print(x)


if __name__ == "__main__":
    main()
