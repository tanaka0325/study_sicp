(define (cont-frac n d k)
  (define (cf i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(print (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12))
