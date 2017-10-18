(use slib)
(require 'trace)

; (define (product term a next b)
;   (define (iter a result)
;     (if (> a b)
;         result
;         (iter (next a) (* (term a) result))))
;   (trace iter)
;   (iter a 1))


(define (factorial n)
  (define (inc n) (+ n 1))
  (product + 1 inc n))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;         (sum term (next a) next b))))

; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;         (sum term (next a) next b))))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(trace product)
(print (factorial 6))
n
