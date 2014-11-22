#lang racket

(define (halve x) (/ x 2))
(define (double x) (* x 2))

; s can be treated as a pseudo-carry here, so we need to add it back in
; at the end.
(define (fast-mul-iter a b s)
  (cond 
    ((= b 0) 0)
    ((= b 1) (+ a s))
    ((even? b) (fast-mul-iter (double a) (halve b) s))
    (else (fast-mul-iter a (- b 1) (+ s a)))))

(define (fast-mul a b)
  (fast-mul-iter a b 0))

(fast-mul 5 5)
(fast-mul 5 7)
(fast-mul 1 7)
