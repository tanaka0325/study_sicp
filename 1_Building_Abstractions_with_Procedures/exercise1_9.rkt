#lang racket

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

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
; 上の場合は、再帰プロセス


; (define (+ a b)
;   (if (= a 0) b (+ (dec a) (inc b))))

; (+ 4 5)
; (+ 3 6)
; (+ (dec 3) (inc 6))
