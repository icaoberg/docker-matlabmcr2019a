# docker-matlabmcr2019a

> **DEPRECATED:** This repository is no longer maintained. No further updates, bug fixes, or support will be provided.

[![GitHub issues](https://img.shields.io/github/issues/icaoberg/docker-matlabmcr2019a.svg)](https://github.com/icaoberg/docker-matlabmcr2019a/issues)
[![GitHub forks](https://img.shields.io/github/forks/icaoberg/docker-matlabmcr2019a.svg)](https://github.com/icaoberg/docker-matlabmcr2019a/network)
[![GitHub stars](https://img.shields.io/github/stars/icaoberg/docker-matlabmcr2019a.svg)](https://github.com/icaoberg/docker-matlabmcr2019a/stargazers)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://raw.githubusercontent.com/icaoberg/docker-matlabmcr2019a/master/LICENSE)

The [MATLAB Runtime](https://www.mathworks.com/products/compiler/matlab-runtime.html) is a standalone set of shared libraries that enables the execution of compiled MATLAB applications or components on computers that do not have MATLAB installed. When used together, MATLAB, MATLAB Compiler, and the MATLAB Runtime enable you to create and distribute numerical applications or software components quickly and securely.

To build an image using the `Dockerfile` in this repository, run the command

```
➜ docker build -t "murphylab/matlabmcr2019a" .
```

This should build an image

```
➜  docker container ls -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                        PORTS               NAMES
48dde52f2bc8        murphylab/matlabmcr2019a     "/bin/bash -c 'pyt..."   45 seconds ago      Exited (0) 39 seconds ago                         frosty_wescoff
```

## Contributing

This repository is deprecated and no longer accepts contributions.

---

Support for [CellOrganizer](http://cellorganizer.org/) has been provided by grants GM075205, GM090033 and GM103712 from the [National Institute of General Medical Sciences](http://www.nigms.nih.gov/), grants MCB1121919 and MCB1121793 from the [U.S. National Science Foundation](http://nsf.gov/), by a Forschungspreis from the [Alexander von Humboldt Foundation](http://www.humboldt-foundation.de/), and by the [Freiburg Institute for Advanced Studies](http://www.frias.uni-freiburg.de/lifenet?set_language=en).

Copyright (c) 2007-2019 by the [Murphy Lab](http://murphylab.web.cmu.edu) at the [Computational Biology Department](http://www.cbd.cmu.edu) in [Carnegie Mellon University](http://www.cmu.edu)
