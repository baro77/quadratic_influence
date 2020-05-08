# Quadratic Influence misc stuff

Support repository for article "TITLE ARTICLE" hosted on Medium: LINK_MEDIUM

* [referendum_code.m](https://github.com/baro77/quadratic_influence/blob/master/referendum_code.m) contains unleashed Octave code defining _p(y,n,i)_ and _∆p(y,n,i)_ and plotting graphs of the referendum model;

* [BALLOT_PRECOMPUTED_PYs](https://github.com/baro77/quadratic_influence/tree/master/BALLOT_PRECOMPUTED_PYs) is a quite big archive (almost 1GB overall) of precomputed values of _p(y,n,i)_ for the 101 x 1000 x 502 lattice domain defined by:
  * _y ∈ (0, 0.01, 0.02, ..., 1)_
  * _n ∈ (1, 2, 3, ..., 1000)_
  * _i ∈ (0, 1, 2, ..., 501)_
  
  It also hosts a second function defining _p(y,n,i)_ in a more Octave-ish way, thanks to use of matrix algebra instead of almost all ```for``` cycles.
