#lang racket

; I wanted to do this one with minimal use of library functions
(define (max x y) 
  (cond ((> x y) x)
        (else y)))

(define (exercise1-3 a b c)
  (let ((x (max a b))
        (y (max b c)))
     (+ (* x x) (* y y))))

(exercise1-3 1 2 3)
(exercise1-3 3 2 1)
(exercise1-3 3 1 2)
