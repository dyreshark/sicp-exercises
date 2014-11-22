#lang racket


; Given:
(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; Normal order, n-1 GCDs are applied, where n is the number of iterations of gcd needed
; for the numbers. In the case of (gcd 206 40), this is 6 calls.
; Applicative order, infinite calls to GCD are made, because we needed to evaluate
; both sides of the `if` before producing a value.
