#lang racket

(define  (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a b c)
  (if (> a b)
    (if (> b c)
      (sum-of-squares a b)
      (sum-of-squares a c)
    )
    (if (> a c)
      (sum-of-squares a b)
      (sum-of-squares b c)
    )
  )
)

"test: (f 1 2 3)"
(if (= (f 1 2 3) 13) "pass" "fail")

"test: (f 3 3 3)"
(if (= (f 3 3 3) 18) "pass" "fail")

"test: (f 10 -3 0)"
(if (= (f 10 -3 0) 100) "pass" "fail")
