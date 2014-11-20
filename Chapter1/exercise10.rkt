#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; (A 1 10) 
; -> (* 2 (A 1 9))
; -> (* 2 (A 0 (A 1 8)))
; -> (* 4 (A 0 (A 1 7)))
; -> (* 4 (* 2 (A 1 7)))
; -> (* 8 (A 1 7))
; -> (* 16 (A 1 6))
; -> (* 32 (A 1 5))
; -> (* 64 (A 1 4))
; -> (* 128 (A 1 3))
; -> (* 256 (A 1 2))
; -> (* 512 (A 1 1))
; -> (* 512 2)
; -> 1024
; So (A 1 n) does n^2.
(A 1 10)

; (A 2 4) 
; -> (A 1 (A 2 3)) 
; -> (A 1 (A 1 (A 2 2))) 
; -> (A 1 (A 1 (A 1 (A 2 1))))
; -> (A 1 (A 1 (A 1 2)))
; Using the definition above, (A 1 2) = 2^2 = 4
; -> (A 1 (A 1 4))
; (A 1 4) -> 2^4 -> 16
; -> (A 1 16)
; (A 1 16) -> 2^16 -> 65536
; So 2^(2^(2^2))
(A 2 4)

(A 3 3)

; So the answers produced are all 2^n, for some integer n.

(define (f n) (A 0 n))   ; 2*n
(define (g n) (A 1 n))   ; 2^n
(define (h n) (A 2 n))   ; f 1 = 2; f x = 2^(f(x-1)), for x >= 1
