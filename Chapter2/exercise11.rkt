#lang racket

; TODO: Test. High level idea seems to make sense though.

; The nine cases are spelled out explicitly below in order to conform to the
; assignment. Normally I'd do (same-sign? a b) in cases where we have two similar
; blocks where the difference in the predicates is as simple as (negative? x) vs
; (positive? x)

; Hey look, nine cases:
; [-, -] * [-, -]
; [-, -] * [-, +]
; [-, -] * [+, +]
; [-, +] * [-, -]
; [-, +] * [-, +]
; [-, +] * [+, +]
; [+, +] * [-, -]
; [+, +] * [-, +]
; [+, +] * [+, +]
(define (mul-interval x y)
  (let* ([x-lo (lower-bound x)]
         [y-lo (lower-bound y)]
         [x-hi (upper-bound x)]
         [y-hi (upper-bound y)]
         [x-lo-neg (negative? x-lo)]
         [y-lo-neg (negative? y-lo)]
         [x-hi-neg (negative? x-hi)]
         [y-hi-neg (negative? y-hi)])
    (assert (and (<= x-lo x-hi) (<= y-lo y-hi)))
    (case
      [(and x-lo-neg x-hi-neg y-lo-neg y-hi-neg)
       (make-interval (* x-hi y-hi) (* x-lo y-lo))]
      [(and x-lo-neg x-hi-neg y-lo-neg (not y-hi-neg))
       (make-interval (* x-lo y-hi) (* x-hi y-lo))]
      [(and x-lo-neg x-hi-neg (not y-lo-neg) (not y-hi-neg))
       (make-interval (* x-lo y-hi) (* x-hi y-lo))]
      [(and x-lo-neg (not x-hi-neg) y-lo-neg y-hi-neg)
       (make-interval (* x-hi y-lo) (* x-lo y-lo))]
      [(and x-lo-neg (not x-hi-neg) y-lo-neg (not y-hi-neg))
       (let ([p1 (* x-lo y-lo)]  ; +
             [p2 (* x-hi y-lo)]  ; - 
             [p3 (* x-lo y-hi)]  ; -
             [p4 (* x-hi y-hi)]) ; +
         (make-interval (min p2 p3) (max p1 p4)))]
      [(and x-lo-neg (not x-hi-neg) (not y-lo-neg) (not y-hi-neg))
       (make-interval (* x-lo y-hi) (* x-hi y-hi))]
      [(and (not x-lo-neg) (not x-hi-neg) y-lo-neg y-hi-neg)
       (make-interval (* x-lo y-hi) (* x-hi y-lo))]
      [(and (not x-lo-neg) (not x-hi-neg) y-lo-neg (not y-hi-neg))
       (make-interval (* x-hi y-lo) (* x-hi y-hi))]
      [else (make-interval (* x-lo y-lo) (* x-hi y-hi))]
      )))
