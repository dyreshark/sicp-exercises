#lang racket

; Original implementation

(define (square x) (* x x))
(define (cube x) (* x x x))

(define (improve guess x)
  (let* ((num-fst (/ x (square guess)))
         (num (+ num-fst (* 2 guess))))
    (/ num 3)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (* x 0.001)))

(define (curt-iter guess x)
  (if (good-enough? guess x)
    guess 
    (curt-iter (improve guess x) x)))

(define (curt x)
  (curt-iter 1.0 x))

(curt 1000)
