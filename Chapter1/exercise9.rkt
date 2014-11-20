#lang racket

; (define (+ a b)
;   (if (= a 0) b  (inc (+ (dec a) b))))
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc (inc 5)))))
;
; Recursive, because `inc` is called on the output `a` times.
;
; (define (+ a b)
;   (if (= a 0) b  (+ (dec a)  (inc b))))
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
;
; Iterative, because no state is being kept for each iteration,
; nor is any function call waiting on the completion of the
; (+ (dec a) (inc b)) operation.

