#lang racket

; Iterative fast-expt

(define (fast-expt-iter b n s)
  (cond ((zero? n) s)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) s))
        (else (fast-expt-iter b (- n 1) (* s b)))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (square n) (* n n))

(define (fast-expt-rec b n)
  (cond ((zero? n) 1)
        ((even? n) (square (fast-expt-rec b (/ n 2))))
        (else (* b (fast-expt-rec b (- n 1))))))

(fast-expt-rec 2 10)
(fast-expt 2 10)
