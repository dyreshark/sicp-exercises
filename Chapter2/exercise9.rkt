#lang racket

; Interval = (l, h)
; Sum of two intervals, a and b:
;   a + b = (al + bl, ah + bh)
; Width of an interval:
;   w((l, h)) = h - l
; Width of the sum of two intervals a and b:
;   w((al + bl, ah + bh)) = (ah + bh) - (al + bl)
;                         = ah + bh - al - bl
;                         = ah - al + bh - bl
;                         = (ah - al) + (bh - bl)
;                         = w(a) + w(b)
; Therefore, the width of addition is a function only
; of the widths of the argument intervals.
;
; Similarly, for subtraction:
;   w((al - bl, ah - bh)) = (ah - bh) - (al - bl)
;                         = ah - bh - al + bl
;                         = ah - al - bh + bl
;                         = (ah - al) + (-bh + bl)
;                         = (ah - al) - (bh - bl)
;                         = w(a) - w(b)
; Therefore, the width of subtraction is a function only
; of the widths of the argument intervals.

; Not true for multiplication:
; Given four intervals a, b, c, d such that the width of each interval
; is 1, we would expect w(a*b) = w(c*d), because the width of a, b, c, and d
; are identical.
; 
; However, for four arbitrarily chosen intervals a=(1,2), b=(1,2), c=(2,3), 
; d=(3,4), we see that w(a*b) = 2*2 - 1*1 = 3, and w(c*d) = 4*3 - 3*2 = 6.
; Because w(a*b) != w(c*d), it has been proven that w(x*y) is not a function
; of purely w(x) and w(y).
;
; Similarly, for division, with the same argument and intervals:
; w(a/b) = 2/2 - 1/1 = 0
; w(c/d) = 2/3 - 3/4 != 0
;
; Therefore, the same holds for division as multiplication
