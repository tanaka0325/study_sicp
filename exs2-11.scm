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

(define a (make-interval 3.14 4.56))
(define b (make-interval 3.14 (- 4.56)))
(define c (make-interval (- 5.25) (- 6.33)))

(print (mul-interval a a))
(print (mul-interval a b))
(print (mul-interval a c))

(print (mul-interval b a))
(print (mul-interval b b))
(print (mul-interval b c))

(print (mul-interval c a))
(print (mul-interval c b))
(print (mul-interval c c))


; (9.8596 . 20.793599999999998)
; (-20.793599999999998 . 14.318399999999999)
; (-28.8648 . -16.485)
; (-20.793599999999998 . 14.318399999999999)
; (-14.318399999999999 . 20.793599999999998)
; (-19.8762 . 28.8648)
; (-28.8648 . -16.485)
; (-19.8762 . 28.8648)
; (27.5625 . 40.0689)
