(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter a)
                  (combiner (term a) result)
                  result))))
  (iter a null-value))

(define (double x) (* x x))
(define (inc n) (+ n 1))

; (print (filtered-accumulate prime? + 0 double 0 inc 10))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(use slib)
(require 'trace)

(define (calc n a b)
  (define (filter i)
    (if (and (< i n) (= (gcd i n) 1)) #t #f))
  (trace filter)
  (filtered-accumulate filter * 1 + a inc b))

(print (calc 5 1 10))
