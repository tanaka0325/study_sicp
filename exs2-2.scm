;; point method
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (mid-point a b)
  (if (or (and (>= a 0) (>= b 0)) (and (< a 0) (< b 0)))
      (/ (+ a b) 2)
      (+ a b)))
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

;; segment method
(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let ((start-point (start-segment segment)) (end-point (end-segment segment)))
        (cons
          (mid-point (x-point start-point) (x-point end-point))
          (mid-point (y-point start-point) (y-point end-point)))))




;;; test
(define start (make-point -1 -4))
(define end (make-point 3 1))
(print-point start)
(print-point end)

(define seg (make-segment start end))
(print-point (midpoint-segment seg))

(newline)
(define start1 (make-point 0 0))
(define end1 (make-point 4 5))
(print-point start1)
(print-point end1)

(define seg1 (make-segment start1 end1))
(print-point (midpoint-segment seg1))
