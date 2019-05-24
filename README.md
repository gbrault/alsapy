# alsapy
swig POC to interface alsa with python

I wanted to build a clean interface for ALSA with py, so swig was one of the natural way to go.
It's far to be finished but it's quite simple to extend.

To make it very simple, it's a matter of adding external function prototypes in the swig spec file.

Here are the "input" and documentation files

- alsapy.i => the swig interface spec
- compile.tx => how to compile this
- ccards.py is counting installed audio cards on your configuration
- cncards.py provides the card names beside counting
- other files are generated by compilers
- needs to be in the development directory to test

Suppose swig 4.0 installed and gcc + alsa
