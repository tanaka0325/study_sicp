(define (accumulate combiner null-value term a next b)
(if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; 試す
(define (inc n) (+ n 1))
(define (cube x) (* x x x))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-cubes a b)
  (sum cube a inc b))
(print (sum-cubes 1 10))
; => 3025

(define (factorial n)
  (product + 1 inc n))
(print (factorial 10))
; => 3628800
