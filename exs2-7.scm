(define (make-interval a b) (cons a b))

(define (upper-bound x)
  (max (car x) (cdr x)))

(define (lower-bound x)
  (min (car x) (cdr x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define foo (make-interval 3.14 4.56))
; 差=1.42 幅=0.71
(define bar (make-interval 5.25 6.33))
; (0.6900000000000004 . 3.19)
; 差=1.08 幅=0.54

; 差の合計=2.5　幅の合計=1.25

(print (add-interval foo bar))
; (8.39 . 10.89)
; 差=2.5 幅=1.25

(print (sub-interval bar foo))
; (0.6900000000000004 . 3.19)
; 差=2.5 幅=1.25

(print (mul-interval foo bar))
; (16.485 . 28.8648)
; 差=12.3798 幅=6.1899

(print (div-interval foo bar))
; (0.49605055292259087 . 0.8685714285714284)
; 差=0.372520876 幅=0.186260438
