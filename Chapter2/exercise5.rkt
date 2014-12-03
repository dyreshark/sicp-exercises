#lang racket

(define (cons- x y)
  (* (expt 2 x) (expt 3 y)))

; Observations:
; 2^a * 3^b = n
; lg n - a lg 2 = b lg 3
; (lg n - a lg 2) / lg 3 = b
; lg n - b lg 3 = a lg 2
; (lg n - b lg 3) / lg 2 = a
; --
; All powers of 3 are odd, all powers of 2 are even, odd*even = even.
; So we can iteratively strip off powers of two until we're stuck with
; an even number.

; Extract 2^n
(define (car- z)
  (letrec ([iter (lambda (c i)
                   (if (odd? c)
                     i
                     (iter (/ c 2) (+ i 1))))])
    (iter z 0)))

; Extract 3^n
(define (cdr- z)
  (let* ([x (car- z)]
         [num (- (log z) (* x (log 2)))]
         [denom (log 3)])
    (inexact->exact (round (/ num denom)))))

; "Testing"
(define (try-once x y)
  (let* ([pair (cons- x y)]
         [x- (car- pair)]
         [y- (cdr- pair)])
    (printf "(~a, ~a) => (~a, ~a)\n" x y x- y-)))

(try-once 1 1)
(try-once 1 5)
(try-once 5 1)
(try-once 5 5)
