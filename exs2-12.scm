(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

; 正の数か判定
(define (positive? n) (if (>= n 0) #t #f))
; 区間の両端が正の数か判定
(define (pos-pos? x)
  (if (and (positive? (lower-bound x)) (positive? (upper-bound x))) #t #f))
; 区間が負の数、正の数か判定
(define (neg-pos? x)
  (if (and (not (positive? (lower-bound x))) (positive? (upper-bound x))) #t #f))
; 区間の両端が負の数か判定
(define (neg-neg? x)
  (if (and (not (positive? (lower-bound x))) (not (positive? (upper-bound x)))) #t #f))

(define (up-up x y) (* (upper-bound x) (upper-bound y)))
(define (up-low x y) (* (upper-bound x) (lower-bound y)))
(define (low-up x y) (* (lower-bound x) (upper-bound y)))
(define (low-low x y) (* (lower-bound x) (lower-bound y)))

(define (mul-interval x y)
  (cond
    ((and (pos-pos? x) (pos-pos? y)) (make-interval (low-low x y) (up-up x y)))
    ((and (pos-pos? x) (neg-pos? y)) (make-interval (up-low x y) (up-up x y)))
    ((and (pos-pos? x) (neg-neg? y)) (make-interval (up-low x y) (low-up x y)))
    ((and (neg-pos? x) (pos-pos? y)) (make-interval (low-up x y) (up-up x y)))
    ((and (neg-pos? x) (neg-neg? y)) (make-interval (up-low x y) (low-low x y)))
    ((and (neg-neg? x) (pos-pos? y)) (make-interval (low-up x y) (up-low x y)))
    ((and (neg-neg? x) (neg-pos? y)) (make-interval (low-up x y) (low-low x y)))
    ((and (neg-neg? x) (neg-neg? y)) (make-interval (up-up x y) (low-low x y)))
    (else  (make-interval (min (low-up x y) (up-low x y))
                          (max (up-up x y) (low-low x y))))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (/(* c (/ p 100)) 2)))

(define (percent i)
  (* (* (/ (width i) (center i)) 2) 100))

; (define (percent i)
;   (* (/ (- (upper-bound i) (lower-bound i)) (center i)) 100))

(define a (make-center-width 3.5 0.175))
(print a)

(define b (make-center-percent 3.5 10))
(print b)

(print (center b))
(print (width b))
(print (percent b))

