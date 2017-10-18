(use slib)
(require 'trace)

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

; (print ((compose square inc) 6))
; ; 49

(define (repeated f n)
  (define (iter cnt result)
    (if (= cnt n)
        (lambda (x) (result x))
        (iter (+ cnt 1) (compose f result))))
  (iter 0 (lambda (fn) fn)))

(print ((repeated square 2) 5))

