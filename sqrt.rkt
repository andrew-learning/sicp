#lang racket

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y)
     2))

(define (good-enough? guess x)
  (if (< (abs (- x (square guess))) 0.001)
         #t
         #f))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 40)

; Iterative processes ... but it's calling a function itself
; difference is the iterative function has all the information it needs in the arguments
; rather than accumulating information on the stack

; Michael also says that if you stop the process half way through you can see where you are.

; Exercises ...

