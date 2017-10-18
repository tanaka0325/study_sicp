#lang racket

(require racket/trace)

; (define (f n)
;   (cond ((< n 3) n)
;     (else
;       (+ (f (- n 1))
;         (* 2 (f (- n 2)))
;         (* 3 (f (- n 3)))))))

(define (f n)
  (define (f-iter a b c count)
    (if (< count 3) a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (cond ((< n 3) n)
        (else
          (f-iter 2 1 0 n))))

(f 7)
