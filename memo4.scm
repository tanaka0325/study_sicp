(use slib)
(require 'trace)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;         (sum term (next a) next b))))

; (define (sum-cubes a b)
;   (sum cube a inc b))

; (define (sum term a next b)
;   (define (iter a result)
;     (if ⟨??⟩
;         ⟨??⟩
;         (iter ⟨??⟩ ⟨??⟩)))
;   (iter ⟨??⟩ ⟨??⟩))

; (define (sum term a next b)
;   (define (iter a result)
;     (if (> a b)
;         result
;         (iter a result)))
;   (trace iter)
;   (iter a (next a)))

; (define (sum term a next b)
;   (sum-iter term a next b 0))
  ; (if (> a b)
  ;     0
  ;     (+ (term a)
  ;       (sum term (next a) next b))))

; (define (sum-iter term start next end result)
;   (if (> start end) result
;       (sum-iter term (next start) next end (+ (term start) result) )))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (trace iter)
  (iter a 0))

(trace sum)
(print (sum cube 1 inc 10))

; CALL sum #[proc] 1 #[proc] 10
; CALL iter 1 0
;   CALL iter 2 1
;     CALL iter 3 9
;       CALL iter 4 36
;         CALL iter 5 100
;         RETN iter 3025
;       RETN iter 3025
;     RETN iter 3025
;   RETN iter 3025
; RETN iter 3025
;                              RETN sum 3025
; 3025
