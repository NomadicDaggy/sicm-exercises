#lang sicp

; Write a procedure that computes elements of Pascal's triangle
;
; I'm going to asume that we need to create an f(n,m) that computes
; the m'th of a Pascal triangle's n'th row.

(define (pascal row col)
  (cond ((< row 3) 1)
        ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))