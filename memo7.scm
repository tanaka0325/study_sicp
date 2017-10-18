(define (inc n) (+ n 1))
(define (cube x) (* x x x))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter a)
                  (combiner (term a) result)
                  result))))
  (iter a null-value))

(define (prime? number)
  (cond
      ((< number 2) #f)   ; 負の数ならびに1ならば素数ではない
      ((< number 4) #t)   ; 2または3ならば素数
      ((even? number) #f) ; 2を除く偶数の場合素数ではない
      (else               ; 3以上の奇数の場合は試し割りを実行
          (let loop((i 3))
              (if (<= i (sqrt number))
                  (if (= (modulo number i) 0)
                      #f
                      (loop (+ i 2)))
                  #t)))))

(define (myfilter a)
  (> a 0))

(define (sum term a next b)
  (filtered-accumulate myfilter + 0 term a next b))
(define (product term a next b)
  (filtered-accumulate myfilter * 1 term a next b))

(define (sum-cubes a b)
  (sum cube a inc b))
(print (sum-cubes 1 10))
; => 3025

(define (factorial n)
  (product + 1 inc n))
(print (factorial 10))
; => 3628800'
