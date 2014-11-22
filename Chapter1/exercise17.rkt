#lang racket

(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (fast-mul a b)
  (cond 
    ((= b 0) 0)
    ((= b 1) a)
    ((even? b) (fast-mul (double a) (halve b)))
    (else (+ a (fast-mul a (- b 1))))))

(fast-mul 5 5)
(fast-mul 5 7)
(fast-mul 1 7)
