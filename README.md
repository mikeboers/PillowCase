# PillowCase

[![Build Status](https://travis-ci.org/mikeboers/PillowCase.svg?branch=master)](https://travis-ci.org/mikeboers/PillowCase)

This Python "package" smooths out automatic installation issues due to the [PIL][PIL]/[Pillow][Pillow] fork. It does this in 2 ways:

1. If PIL is installed, do nothing.
2. If PIL is not installed, "require" Pillow (so that it will be installed) and create a stub `egg-info` for PIL so that package managers will not try to install it in top of Pillow.

If installed first, this effectively stops PIL and Pillow from fighting over who is returned from an `import PIL`.

[PIL]: http://www.pythonware.com/products/pil/
[Pillow]: http://python-imaging.github.io/
