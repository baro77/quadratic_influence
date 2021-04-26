# Quadratic Influence misc stuff

Support repository for article _"Quadratic Payments with constrained probabilities"_ [originally published on Medium (June 10th, 2020)](https://medium.com/@baro77/quadratic-payments-with-constrained-probabilities-b40facba716) and [rewritten in LaTeX on April 2021](https://github.com/baro77/quadratic_influence/tree/master/LATEX) to use a typesetting environment more suitable for this kind of content

* [referendum_code.m](https://github.com/baro77/quadratic_influence/blob/master/referendum_code.m) contains unleashed Octave code defining _p(y,n,i)_ and _∆p(y,n,i)_ and plotting graphs of the referendum model;

* [BALLOT_PRECOMPUTED_PYs](https://github.com/baro77/quadratic_influence/tree/master/BALLOT_PRECOMPUTED_PYs) is a quite big archive (almost 1GB overall) of precomputed values of _p(y,n,i)_ for the 101 x 1000 x 502 lattice domain defined by:
  * _y ∈ (0, 0.01, 0.02, ..., 1)_
  * _n ∈ (1, 2, 3, ..., 1000)_
  * _i ∈ (0, 1, 2, ..., 501)_
  
  It also hosts a second function defining _p(y,n,i)_ in a more Octave-ish way, thanks to use of matrix algebra instead of almost all ```for``` cycles.
  
  More details in folder's [README.md](https://github.com/baro77/quadratic_influence/blob/master/BALLOT_PRECOMPUTED_PYs/README.md) file

* [LATEX](https://github.com/baro77/quadratic_influence/tree/master/LATEX) folder contains .tex source for the article, together with bibliography support files and PDF obtained with PdfLaTeX via TeXstudio

### NOTE
Even if function outputs represent probabilities (so values bounded in [0,1]), intermediate stages of implemented formulas can lead to overflow of double floating point numbers used by Octave, e.g. resulting in ∞⋅0 and ```NaN```. The above lattice domain is almost the biggest currently allowed, for bigger ones code refactoring is an actual need.
