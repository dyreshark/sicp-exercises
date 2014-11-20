#lang racket

; Original implementation

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess 
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; This works poorly on small numbers because `good-enough?` tries to get guess^2
; within 0.001 of the given number. If the given number is, say, 1e-100, then 
; `good-enough?` would note that any number less than or equal to 0.001 is
; "good enough" to be the sqrt of 1e-100.
;
; Additionally, a fixed number of bits has to limit its precision at some point.
; If the mathematical square root of some number x lies between two machine 
; representations of x^(1/2), y and z, and |x - y^2| > 0.001 and 
; |x - z^2| > 0.001, then this algorithm will loop or recurse forever 
; (or until the stack is blown) trying to answer an effectively unanswerable
; question.

; good-enough? could be changed to the following in order to ensure it works
; nearly equally well on all numbers, regardless of magnitude:
(define (new-good-enough? guess x)
  (< (abs (- (square guess) x)) (* x 0.001)))


