#lang racket

(require racket/trace)

(define (pascal l i)
  (cond ((< l i) "out of range")
        ((= i 1) 1)
        ((= l i) 1)
        (else
          (+ (pascal (- l 1) i)
             (pascal (- l 1) (- i 1))))))

(pascal 6 3)
