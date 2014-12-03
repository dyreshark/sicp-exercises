#lang racket

(define (make-rat n d)
  (let ([neg (xor (negative? n) (negative? d))])
    (if neg
      (cons (- (abs n)) (abs d))
      (cons (abs n) (abs d)))))
