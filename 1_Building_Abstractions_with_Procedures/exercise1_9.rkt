#lang racket

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

; (define (+ a b)
; (if (= 0 a) b (inc (+ (dec a) b))))

; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc (if (= 0 0) 5 (inc (+ (dec 0) 5)))))))
; (inc (inc (inc (inc (5)))))
; (inc (inc (inc (6))))
; (inc (inc (7)))
; (inc 8)
; 9
; 再帰的


(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ (- 4 1) (+ 5 1))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ (- 3 1) (+ 6 1))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ (- 2 1) (+ 7 1))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ (- 1 1) (+ 8 1))
; (+ 0 9)
; 9
; 反復的
