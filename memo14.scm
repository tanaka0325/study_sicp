(use slib)
(require 'trace)

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))

(trace double)
(print (((double (double double)) inc) 5))


