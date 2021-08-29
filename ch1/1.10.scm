#lang sicp

; (A 1 10) =
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8))))
; (A 0 (A 0 (A 0 (A 1 7))))))
; ...
; (A 0 ... (A 0 (A 1 1)
; (A 0 ... (A 0 (A 0 2) ; Goes deeper 9 times to get here, so will take 9 multiplications
; (A 0 ... (A 0 4))     ; to get back
; ...
; (A 0 2^9)
; 2^10 = 1024

; (A 2 4) =
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4)) ; (A 1 4) = 2^4 = 16 per the first example
; (A 1 16) = 2^16 = 65536


; (A 3 3) =
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2)))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)
; ... (previous example)
; 65536

; (define (f n) (A 0 n))
; x=0, so computes 2n

; (define (g n) (A 1 n))
; General case of first example (A 1 10)
; computes 2^n

; (define (h n) (A 2 n))
; General case of the second example (A 2 4)
; computes 2↑n2 , meaning 2 to the power of 2 n times.

; Code for checking
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
  