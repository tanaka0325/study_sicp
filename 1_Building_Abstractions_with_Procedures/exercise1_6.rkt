#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;;;

(define  (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x) x)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

; ifの特殊形式は、まずはじめにpredicateが評価され、
; trueだったら第一引数が、falseだったら第二引数が評価される。
; new-ifは特殊形式ではないので、
; 引数を複数与えられたらそのタイミングで評価してしまう。
; なので、上記の例ではnew-ifの第三引数のsqrt-iterが、
; good-enough?の真偽に関わらず評価され無限ループに陥る。
