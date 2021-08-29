#lang sicp

; The code given
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs(- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; (sqrt 0.000000123) correct answer is 0.00035071355833500367
; answer given with current code is   0.031251310707787285
; This offset happens because the good-enough? test checks only if the result
;   is within 0.001 of the guess and 0.031251310707787285 ^ 2 = 0.0009766444209546603
;   which is indeed within 0.001 of                             0.000000123
;
; (sqrt 984128590129581032859810124810924801928120948120948120948120948120) gives a
; correct answer and I'm not exactly sure why.


; Improved code
(define (better-enough? guess x)
  (< (abs(- (square guess) x)) (* guess 0.00001)))

(define (sqrt-iter-better guess x)
  (if (better-enough? guess x)
      guess
      (sqrt-iter-better (improve guess x) x)))

(define (better-sqrt x)
  (sqrt-iter-better 1.0 x))

; (better-sqrt 0.000000123) now returns 0.00035296197482036635 which is a lot closer
; and could be improved by reducing the fraction of the guess further.
;
; (better-sqrt 984128590129581032859810124810924801928120948120948120948120948120)
; still gives 9.920325549746747e+32 which is correct as far as I can tell.
