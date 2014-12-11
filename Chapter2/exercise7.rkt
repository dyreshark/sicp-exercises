#lang racket

; Alyssa always passes lower-bound as arg0 of the make-interval ctor
(define lower-bound car)
(define upper-bound cdr)
