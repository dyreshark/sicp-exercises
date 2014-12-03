#lang racket

(define start-segment car)
(define end-segment cdr)
(define make-segment cons)

(define x-point car)
(define y-point cdr)
(define make-point cons)

(define (points p) (values (x-point p) (y-point p)))
(define (average a b) (/ (+ a b) 2))

(define (midpoint-segment seg)
  (let-values ([(xa ya) (points (start-segment seg))]
               [(xb yb) (points (end-segment seg))])
    (make-point (average xa xb) (average ya yb))))

(define segments 
  (list (make-segment (make-point 0 0) (make-point 5 5))
        (make-segment (make-point 5 5) (make-point 5 5))
        (make-segment (make-point 5 5) (make-point 0 0))
        (make-segment (make-point -5 -5) (make-point 0 0))))

(map midpoint-segment segments)
