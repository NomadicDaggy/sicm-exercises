#lang sicp
(define (square a)
    (* a a))

(define (smallest a b)
    (if (< a b) a b))

(define (largest a b)
    (if (> a b) a b))

(define (largest-sum-squares a b c)
    (+ (square (largest a b))
       (square (largest (smallest a b) c))))