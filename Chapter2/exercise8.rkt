#lang racket

; The difference between two intervals x and y can be calculated by finding
; the difference between the upper-bounds of x and y, and the difference between
; the lower-bounds of x and y. More concisely:
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))
