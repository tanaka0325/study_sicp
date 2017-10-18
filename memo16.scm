(define (oddp x)
  (= (remainder x 2) 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter cnt result)
    (if (= cnt n)
        (lambda (x) (result x))
        (iter (+ cnt 1) (compose f result))))
  (iter 0 (lambda (fn) fn)))

(define dx 0.1)

(define (smooth f)
  (lambda (x)
          (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

; (define (f x)
;   (let ((ix (floor x)))
;     (if (oddp ix) (+ (- ix x) 1) (- x ix))))

; (do ((x 5 (+ x 1))) ((= x 25))
; (display (list (/ x 10) ((n-fold-smooth f 3) (/ x 10)))) (newline))
