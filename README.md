# monkeybot

A set of libraries of simple CUDA methods.

## Structure

monkeybot is split into the following libraries:

- mbText: text manipulation
- mbMath: simple math functions
- mbMatrix: matrix manipulation

A list of functions included in each library can be found in the included "functions.txt".

## Usage

To use monkeybot, you can either include "monkeybot.cuh", which will include all monkeybot libraries, or whichever individual library you want to use, called "mb<library-name>.cuh".

All monkeybot functions are kept in the namespace "mb".

When compiling your program, make sure you include the path to monkeybot (i.e. use "nvcc -I <path-to-monkeybot> ...").

For sample usage, see the included "helloworld.cu".
