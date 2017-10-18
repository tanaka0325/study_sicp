(use slib)
(require 'trace)

(define (f g) (g 2))

(print (f square))
(print (f (lambda (z) (* z (+ z 1)))))

