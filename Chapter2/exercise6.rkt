#lang racket

; (define zero (lambda (f) (lambda (x) x)))
; (define (add-1 n)
;   (lambda (f) (lambda (x) (f ((n f) x))))
;
; Substituting in...
; (define one (lambda (f) (lambda (x) (f ((zero f) x)))))
; (define one (lambda (f) (lambda (x) (f (x x)))))
; (define two (lambda (f) (lambda (x) (f ((one f) x)))))
; (define two (lambda (f) (lambda (x) (f ((lambda (f1) (lambda (x1) (f1 (x1 x1)))) x)))))
; (define two (lambda (f) (lambda (x) (f ((lambda (x1) (x (x1 x1))) x)))))
; (define two (lambda (f) (lambda (x) (f (x (x x))))))
;
; This definition of numbers implements adding some number n to some number q by 
; calling a user-defined function n additional times (for n+q calls total).
