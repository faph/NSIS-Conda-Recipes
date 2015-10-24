Conda recipes for NSIS packages
===============================

This repo contains recipes to create conda packages for NSIS, NSIS plugins and
NSIS header files.

Read [this NSIS wiki page](http://nsis.sourceforge.net/Conda) for more
information on using conda with NSIS.

The actual conda packages are available at https://anaconda.org/nsis.


Can’t find your favourite NSIS plugin?
--------------------------------------

It’s quite simple to create a conda recipe for NSIS plugins, just have a look
at the examples and create a pull request with a new recipe. We will build the
recipe and publish it on the anaconda.org NSIS channel.

Alternatively, raise an issue and someone may be willing to create a recipe.


Deployment to anaconda.org
--------------------------

Conda recipes are automatically built on appveyor.com when pushed to this
repo, except when the package already exists on https://anaconda.org/nsis.
An exact comparison of version including build string (e.g. `1.0.0-nsis_0`)
is undertaken. To build a package with the same version again, the build
string must be incremented (e.g. `...nsis_1`)!

AppVeyor build status: [![Build status](https://ci.appveyor.com/api/projects/status/ji9xddqa4rwijr89?svg=true)](https://ci.appveyor.com/project/faph/nsis-conda-recipes)

On the master branch only, the built packages are also automatically published
in the NSIS channel on anaconda.org (https://conda.anaconda.org/nsis/win-64).


Licence
-------

Consider the conda recipes public domain, unless otherwise stated.

The actual NSIS plugins remain copyright of their respective authors, of
course, and are distributed from the anaconda.org NSIS channel under their own
licence or terms and conditions.
