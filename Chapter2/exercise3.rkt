#lang racket

(define x-point car)
(define y-point cdr)
(define make-point cons)

(define top-left-corner car)
(define bottom-right-corner cdr)

; Usage: (make-rect top-left-corner bottom-right-corner)
; Assumption: bottom x and y are greater than top x and y,
; respectively
(define make-rect cons)
(define (rect-points r) (values (car r) (cdr r)))

(define (rect-height rect)
  (let ([top (y-point (top-left-corner rect))]
        [bot (y-point (bottom-right-corner rect))])
    (- bot top)))

(define (rect-width rect)
  (let ([left (x-point (top-left-corner rect))]
        [right (x-point (bottom-right-corner rect))])
    (- right left))) 

; Alternate representation: represent rectangles as top-left point,
; x length, y length.
; All we'd need to alter is rect-height and rect-width (to return x length
; and y length) and we could use either representation for rect in the 
; perimeter and area functions below

(define (rect-perimeter rect)
  (+ (* 2 (rect-height rect)) (* 2 (rect-width rect))))

(define (rect-area rect)
  (* (rect-height rect) (rect-width rect)))

(define rects
  (list (make-rect (make-point 0 0) (make-point 5 4))
        (make-rect (make-point 5 4) (make-point 5 4))
        (make-rect (make-point -4 -5) (make-point 0 0))))

(display "Perimeters: ")
(map rect-perimeter rects)

(display "Areas: ")
(map rect-area rects)
