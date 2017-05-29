#lang racket

; 1.8
(define  (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? new-guess old-guess)
  (< (abs(- new-guess old-guess)) 0.0001))

(define (cbrt-iter new-guess old-guess x)
  (if (good-enough? new-guess old-guess)
    new-guess
    (cbrt-iter (improve new-guess x) new-guess x)))

(define (cbrt x)
  (cbrt-iter 1.0 0 x))

(cbrt 1)
(cbrt 2)
(cbrt 3)
(cbrt 9)
(cbrt 0.001)
(cbrt 200000000000000000000)
