; b^2 = b · b
; b^4 = b^2 · b^2
; b^8 = b^4 · b^4

; この方法は、指数が 2 の冪乗である場合にうまくいきます
; また、次の規則を使うことで、一般的な指数計算に二乗の連続を使うことができます。

; b^n = (b^(n/2))^2     n が偶数の場合
; b^n = b · b^(n−1)    n が奇数の場合.

; (define (fast-expt b n)
;   (cond ((= n 0) 1)
;         ((even? n) (square (fast-expt b (/ n 2))))
;         (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b count a)
  (cond ((= count 0) a)
        ((even? count) (fast-expt-iter (* b b)
                                       (/ count 2)
                                       a))
        (else (fast-expt-iter b (- count 1) (* a b)))))

; (define (fast-expt b n)
;   (define (even? n)
;     (= (remainder n 2) 0))
;   (define (fast-expt-iter a b n)
;     (cond ((= n 0) a)
;         ((even? n) (fast-expt-iter a (* b b) (/ n 2)))
;         (else (fast-expt-iter (* a b) b (- n 1)))))
;   (fast-expt-iter 1 b n))

(use slib)
(require 'trace)
(trace fast-expt)
(trace fast-expt-iter)

(print (fast-expt 2 6))
