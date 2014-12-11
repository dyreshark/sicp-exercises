#lang racket

(define (div-interval x y)
  (let ([x-lo (lower-bound x)]
        [y-lo (lower-bound y)]
        [x-hi (upper-bound x)]
        [y-hi (upper-bound y)])
    (if (or (zero? y-lo) (zero? y-hi))
      (raise 'divide-by-zero #t)
      (mul-interval 
        x
        (make-interval (/ 1.0 y-hi) (/ 1.0 y-lo))))))
