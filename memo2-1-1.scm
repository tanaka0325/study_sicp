(define (minus? a b)
  (cond
    ((and (> a 0) (> b 0)) #f)
    ((and (< a 0) (< b 0)) #f)
    ((and (> a 0) (< b 0)) #t)
    ((and (< a 0) (> b 0)) #t)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
(let ((g (abs (gcd n d))))
   (if (< d 0)
       (cons (/ (- n) g) (/ (- d) g))
       (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define one-half (make-rat 1 2))
; (print-rat one-half)
(define one-third (make-rat 1 3))
; (print-rat (add-rat one-half one-third))
; (print-rat (mul-rat one-half one-third))
; (print-rat (add-rat one-third one-third))
(define toto0 (make-rat 1 2))
(define toto (make-rat -1 2))
(define toto1 (make-rat 1 -2))
(define toto2 (make-rat -1 -2))

(display "a")
(print-rat toto0)
(newline)
(display "b")
(print-rat toto2)
(newline)
(display "c")
(print-rat toto1)
(newline)
(display "d")
(print-rat toto)



