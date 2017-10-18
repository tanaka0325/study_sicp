(define (devisible? divide target)
  (= (remainder target divide) 0))

(define (fact-x-iter d n cnt)
  (if (devisible? d n)
      (fact-x-iter d (/ n d) (+ cnt 1))
      cnt))

(define (fact-x-iter-val d n)
  (if (devisible? d n)
      (fact-x-iter-val d (/ n d))
      n))

(define (fact-2 n)
  (fact-x-iter 2 n 0))

(define (fact-3 n)
  (fact-x-iter 3 n 0))

(define (fact-3x n)
  (fact-x-iter 3 (fact-x-iter-val 2 n) 0))

;; 指数計算
(define (exp-iter base n cnt result)
  (if (= cnt n)
    result
    (exp-iter base n (+ cnt 1) (* base result))))

(define (cons a b)
  (* (exp-iter 2 a 0 1) (exp-iter 3 b 0 1)))
(define (car n)
  (fact-x-iter 2 n 0))
(define (cdr n)
  (fact-x-iter 3 n 0))

(print (cons 3 4))
(print (car (cons 3 4)))
(print (cdr (cons 3 4)))
