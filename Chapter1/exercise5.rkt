#lang racket

; Once again, essay. The statement given would execute fully if evaluated 
; normally. This is because the value of `y` is not calculated until it needs
; to be, which is never. Alternatively, applicative-order evaluation would 
; demand that the value of `y` is calculated immediately*, causing the program
; to crash, unless the user can download RAM fast enough to facilitate infinite
; recursion.

; * - Before the function call to `test` begins
