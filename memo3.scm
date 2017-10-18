(use slib)
(require 'trace)


(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0) b
      (fib-iter (+ a b) a (- count 1))))


(trace fib)
(trace fib-iter)
(print (fib 2))

; (define (fast-fib n)
;   (fast-fib-iter 1 0 0 1 n))

; (define (fast-fib-iter a b p q count)
;   (cond ((= count 0) b)
;         ((even? count)
;           (fast-fib-iter a        1
;                     b        0
;                     ⟨??⟩      0
;                     ⟨??⟩      1
;                     (/ count 2)))  1
;         (else (fast-fib-iter (+ (* b q) (* a q) (* a p))
;                         (+ (* b p) (* a q))
;                         p
;                         q
;                         (- count 1)))))
