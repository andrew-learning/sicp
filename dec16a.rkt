#lang racket

;; (define <NAME>
;;   (lambda (a b)
;;     (if (> a b)
;;       0
;;       (+ (<TERM> a)
;;       (<NAME> (<NEXT> a) b))))

(define (cube x) (* x x x))

(define sum
  (lambda (term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b)))))

(sum cube 1 (lambda (x) (+ 1 x)) 10)

(sum (lambda (x) x) 1 (lambda (x) (+ 1 x)) 10)

;; Ex 1.29
;; Simpson's rule for integration of a line between two points
(define simpson-integral
  (lambda (f a b n)
    (define h (/ (- b a) n))
    (define y
      (lambda (k)
        (f (+ a (* k h)))))
    (* (/ h 3.0)
       (+ (y 0)
          (sum (lambda (x)
                 (+ (* 4 (y x))
                    (* 2 (y (+ x 1)))))
               1
               (lambda (x)
                 (+ x 2))
               (- n 1))
          
          (y n)))))

(simpson-integral cube 0 10 1000)

;; Ex. 1.30
(define sum-iter
  (lambda (term a next b)
    (define iter
      (lambda (a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a))))))
    (iter a 0)))

(sum-iter cube 1 (lambda (x) (+ 1 x)) 10)

;; 1.32
(define accumulate
  (lambda (combiner null-value term a next b)
    (define iter
      (lambda (a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a))))))
    (iter a null-value)))

(accumulate + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) 10)

;; 1.34


;(define coprime-product
;  (lambda (n)
;    (define coprime?
;      (lambda (x)
;        (= 1 (gcd x n))))
;    (filtered-accumulate coprime?
;                         *
;                         1
;                         (lambda (x) x)
;                         1
;                         (lambda (x) (+ x 1))
;                         n)))

;(coprime-product 10)

;; Scheme's let is syntactic sugar for lambda ... not the same as Clojure's let which is a macro

(define (f g)
  (g 2))

(f (lambda (z) (* z (+ z 1))))

;(f f)

(lambda (g) (g 2) 2)

; Golden ratio
;; x^2 = x + 1 
;; take the Golden ratio, square it, you get Golden ratio + 1

;; 1-3-4
(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

;; 1.41
(define double
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define inc
  (lambda (x) (+ x 1)))

(((double (double double)) inc) 5)

(((double double) inc) 5)

;; 1.42
(define compose
  (lambda (f g)
    (lambda (x)
      (f (g x)))))

;; 1.43
(define repeated
  (lambda (f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1))))))

((repeated inc 8) 1)


                         