# Precomputed p(y,n,i)

This is a quite big archive of precomputed values of _p(y,n,i)_ for the 101 x 1000 x 502 lattice domain defined by:
  * _y ∈ (0, 0.01, 0.02, ..., 1)_
  * _n ∈ (1, 2, 3, ..., 1000)_
  * _i ∈ (0, 1, 2, ..., 501)_
 
It's total size is almost 1GB, but each chunk isn't more than 10MB to be easily downloadable.
Each file contains probabilities _p(y,n,i)_ for a given value of _y_, e.g. ```PY_1000_502-py020.octave_text``` contains probabilities for _y=20%_.

[precomputed_values_code.m](https://github.com/baro77/quadratic_influence/blob/master/BALLOT_PRECOMPUTED_PYs/precomputed_values_code.m) contains the function used to generate this data (a probability function rewritten in a more Octave-ish way), support code to split its result into the 101 files and to reassemble them in one single Octave 3D array once downloaded on your computer.

As stated in the upper level of this repo, please note that even if _p(y,n,i)_ function outputs represent probabilities (so values bounded in [0,1]), intermediate stages of implemented formulas can lead to overflow of double floating point numbers used by Octave, e.g. resulting in ∞⋅0 and ```NaN```. The above lattice domain is almost the biggest currently allowed, for bigger ones code refactoring is an actual need.
