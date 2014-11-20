#lang racket

; Not necessarily a programming question.
;
; Functions are values, just as numbers are. So, the `if` is evaluated in order
; to determine whether to use `+` or `-`, and the result of that decision is 
; used as the function that `a` and `b` are applied to.
