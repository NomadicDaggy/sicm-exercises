#lang sicp

; f(n) = n           if n < 3
;      = f(n-1)  +
;        2f(n-2) +
;        3f(n-3)     if n >= 3

; This is a recursive process, because when we recurse into any of
; the f-s, the addition of their results is still pending, ie
; the recursive call is not in tail position.
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                  (* 2 (f (- n 2)))
                  (* 3 (f (- n 3)))))))

; To make this process iterative (still a recursive procedure though)
; we need to track f-1, f-2 and f-3, just like the iterative Fibonacci
; that was given, used a and b to track n and n-1.
; Similarly, we can use a, b and c here, initiallizing them to f(2)=2,
; f)1)=1 and f(0)=0 respectively.

(define (iterative-f n)
  (define (iter a b c counter)
    (if (< counter 3) ; this means that on the next run, n=2 and we need to stop
        a ; a keeps the running sum
        (iter (+ a (* 2 b) (* 3 c)) ; 
              a ; f-1 becomes f-2 on the next iteration
              b
              (- counter 1))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))
