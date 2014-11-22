#lang racket

(define (smallest-divisor-iter x chk max)
  (cond
    ((> chk max) x)
    ((= 0 (remainder x chk)) chk)
    (else (smallest-divisor-iter x (+ chk 2) max))))

(define (smallest-divisor x)
  (if (= 0 (remainder x 2))
    2
    (smallest-divisor-iter x 3 (floor (/ x 2)))))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
