#lang racket

; Stack overflow happens because all three arguments (including the recursive
; one) need to be compted before you can enter new-if.
