#ifndef __MONKEYBOT_TEXT__
#define __MONKEYBOT_TEXT__

namespace mb {
    __global__ void copychar(const char *a, char *b) {
        b[threadIdx.x] = a[threadIdx.x];
    }
};

#endif
