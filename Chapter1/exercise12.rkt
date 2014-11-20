#lang racket

(define (dec x) (- x 1))
(define (inc x) (+ x 1))

(define (pascals x y)
  (if (or (zero? x) (= y x))
    1
    (+ (pascals (dec x) (dec y)) (pascals x (dec y)))))

(define (pascals-row-iter y x)
  (if (= x y)
    '(1)
    (cons (pascals x y) (pascals-row-iter y (inc x)))))

(define (pascals-row n)
  (pascals-row-iter n 0))

(define (repeat-indexed-inner i n f)
  (cond
    ((= i n) 'done)
    (else 
      (f i)
      (repeat-indexed-inner (inc i) n f))))

(define (repeat-indexed n f)
  (repeat-indexed-inner 0 n f))

(repeat-indexed 10 (lambda (i) 
                     (print (pascals-row i))
                     (newline)))
