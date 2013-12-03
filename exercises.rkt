#lang racket

; Ex 1.3

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (sum-of-largest-two x y z)
  (cond ((>= x y) (if (> y z) (sum-of-squares x y)
                     (sum-of-squares x z)))
        ((>= y x) (if (> x z) (sum-of-squares y x)
                     (sum-of-squares y z)))))

;(sum-of-largest-two 1 2 3)
;(sum-of-largest-two 2 3 1)
;(sum-of-largest-two 3 1 2)
;(sum-of-largest-two 3 3 3)

; Ex. 1.4



; Ex 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0 
      y))

(test 0 (p))

; applicative order = eval args first ... normal order useful for infinitve functions

;@_tobrien
;thomas.obrien86@gmail.com


                 