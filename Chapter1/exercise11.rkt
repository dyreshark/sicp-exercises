#lang racket

(define (inc n) (+ n 1))
(define (dec n) (- n 1))

; Recursive
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (dec n)) 
                 (* 2 (f-rec (- n 2))) 
                 (* 3 (f-rec (- n 3)))))))

; Unrecursive.
(define (apply-f a b c)
  (+ a (* 2 b) (* 3 c)))

; a is (f (dec n)), b is (f (- n 2)), c is (f (- n 3)), i is iterations left
(define (f-iter-body i a b c)
  (let ((new-s (apply-f a b c)))
    (if (zero? i)
      new-s
      (f-iter-body (dec i) new-s a b))))

(define (f-iter n)
  (if (< n 3) 
    n
    (f-iter-body (- n 3) 2 1 0)))

(f-rec 30)
(f-iter 30)
