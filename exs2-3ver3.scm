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
(define (compare-point compare-operator f p1 p2)
  (if (compare-operator (f p1) (f p2))
      (f p1)
      (f p2)))
(define (bigger-x-point p1 p2)
  (compare-point > x-point p1 p2))
(define (bigger-y-point p1 p2)
  (compare-point > y-point p1 p2))
(define (smaller-x-point p1 p2)
  (compare-point < x-point p1 p2))
(define (smaller-y-point p1 p2)
  (compare-point < y-point p1 p2))

;; segment method
(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
  (let ((start-point (start-segment segment)) (end-point (end-segment segment)))
        (cons
          (mid-point (x-point start-point) (x-point end-point))
          (mid-point (y-point start-point) (y-point end-point)))))
(define (segment-length seg)
  (let ((s (start-segment seg)) (e (end-segment seg)))
       (if (= (- (bigger-x-point s e) (smaller-x-point s e)) 0)
           (- (bigger-y-point s e) (smaller-y-point s e))
           (- (bigger-x-point s e) (smaller-x-point s e)))))

;; rectangle method
(define (make-rectangle seg1 seg2) (cons seg1 seg2))
(define (width-segment rect) (car rect))
(define (height-segment rect) (cdr rect))

(define (rect-width-length rect)
  (segment-length (width-segment rect)))
(define (rect-height-length rect)
  (segment-length (height-segment rect)))

(define (calc-rect-area rect)
  (* (rect-width-length rect) (rect-height-length rect)))
(define (calc-rect-perimeter rect)
  (+ (* (rect-width-length rect) 2) (* (rect-height-length rect) 2)))




;; test
(define s1 (make-point 1 1))
(define e1 (make-point 5 1))
(define seg1 (make-segment s1 e1))

(define s2 (make-point 1 1))
(define e2 (make-point 1 3))
(define seg2 (make-segment s2 e2))

(define rect1 (make-rectangle seg1 seg2))
(print (calc-rect-area rect1))
(print (calc-rect-perimeter rect1))

(define s3 (make-point 0 0))
(define e3 (make-point 10 0))
(define seg3 (make-segment s3 e3))

(define s4 (make-point 0 0))
(define e4 (make-point 0 10))
(define seg4 (make-segment s4 e4))

(define rect2 (make-rectangle seg3 seg4))
(print (calc-rect-area rect2))
(print (calc-rect-perimeter rect2))
