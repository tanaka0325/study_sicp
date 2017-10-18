(use slib)
(require 'trace)

; このアルゴリズムはbに線形のステップ数をとる.
; 加算の他に整数を二倍するdouble演算と(偶数の)整数を2で割るhalve演算もあるとしよう.
; これらを使い, fast-exptと類似の対数的ステップ数の乗算手続きを設計せよ.

(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

; (define (fast-multi a n)
;   (cond ((= n 0) 0)
;         ((even? n) (fast-multi (double a) (halve n)))
;         (else (+ a (fast-multi (double a) (halve (- n 1)))))))

(define (fast-multi a n)
  (fast-multi-iter a n 0))

(define (fast-multi-iter a n x)
  (cond ((= n 0) x)
        ((even? n) (fast-multi-iter (double a) (halve n) x))
        (else (fast-multi-iter a (- n 1) (+ x a)))))

(trace fast-multi)
(trace fast-multi-iter)
(print (fast-multi 2 1003))

