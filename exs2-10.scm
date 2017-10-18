(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
    "Error: Division by zero."
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                  (/ 1.0 (lower-bound y))))))

(define a (make-interval 3.14 4.56))
(define b (make-interval 5.25 6.33))
(define c (make-interval (- 5.25) 6.33))
(define d (make-interval (- 5.25) (- 6.33)))

(print (div-interval a b))
(print (div-interval a c))
(print (div-interval a d))

