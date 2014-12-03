#lang racket

(define (cons- x y) (lambda (m) (m x y)))
(define (car- m) (m (lambda (p q) p)))
(define (cdr- m) (m (lambda (p q) q)))

; We know that car- yields x because if we expand a call to cons/car:
; (car- (cons- 1 2))
; (car- (lambda (m) (m 1 2)))
; ((lambda (m) (m 1 2)) (lambda (p q) p))
; (lambda (1 2) 1)
; 1
;
; Because this chain of calls never maniuplates the data passed in --
; only shuffles it around -- it should work on any type that you can 
; shuffle around. Which is all types in Racket AFAIK.
