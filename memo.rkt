#lang racket

(require racket/trace)

; ; ; (define (fib n)
; ; ;   (cond ((= n 0) 0)
; ; ;         ((= n 1) 1)
; ; ;         (else (+ (fib (- n 1))
; ; ;                 (fib (- n 2))))))

; ; (define (fib n)
; ;   (fib-iter 1 0 n))

; ; (define (fib-iter a b count)
; ;   (if (= count 0)
; ;     b
; ;     (fib-iter (+ a b) a (- count 1))))

; ; ; (define (fib n)
; ; ;   (define (fib-iter a b count)
; ; ;     (if (= count 0)
; ; ;       b
; ; ;       (fib-iter (+ a b) a (- count 1))))
; ; ;   (fib-iter 1 0 n))

; ; (trace fib)
; ; (trace fib-iter)

; ; (fib 9)

; (define (count-change amount) (cc amount 5))

; (define (cc amount kinds-of-coins)
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) (= kinds-of-coins 0)) 0)
;         (else (+ (cc amount
;                     (- kinds-of-coins 1))
;                 (cc (- amount
;                         (first-denomination kinds-of-coins))
;                     kinds-of-coins)))))

; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))

; (count-change 11)


; (trace count-change)
; (trace cc)
; (count-change 10)

; (define (cube x) (* x x x))

; (define (p x) (- (* 3 x) (* 4 (cube x))))

; (define (sine angle)
;    (if (not (> (abs angle) 0.1))
;        angle
;        (p (sine (/ angle 3.0)))))

; (trace cube)
; (trace p)
; (trace sine)

; (sine 100)

(define (even? n)
    (= (remainder n 2) 0))

(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; (define (fast-expt b n)
;     (cond ((= n 0) 1)
;           ((even? n) (1))
;           (else (2))))

; (remainder 1 2)

(fast-expt 2 3)
; (even? 2)
