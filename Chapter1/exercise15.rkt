#lang racket

; a. How many times is procedure p applied when (sine 12.15) is evaluated?
;    Target: 0.1 
;    0.1 = 12.15 / 3^n
;    1/log3 n = 0.1/12.15
;    n = log3 121.5
;    n = 4.3
;    ceil n = 5
;    5.

; b. Order of growth in space/number of steps in terms of `a` when (sine a)
;    is evaluated:
;    Given the analysis above, logarithmic.

