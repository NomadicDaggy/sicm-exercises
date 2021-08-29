#lang sicp

(define (improve y x)
  (/ (+ (/ x (* y y))
        (* 2 y))
     3))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs(- (cube guess) x)) 0.001))

(define (cubrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubrt-iter (improve guess x) x)))

(define (cubrt x)
  (cubrt-iter 1.0 x))