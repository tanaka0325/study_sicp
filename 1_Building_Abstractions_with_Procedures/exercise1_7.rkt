#lang racket

; 1.7
; guess = 推定値
; x = 平方根を求めたい値
(define  (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; 平方根の計算で使ったgood-enough?テストは,
; 非常に小さい数の平方根をとる時には効果的ではない
; また, 実際の計算機では, 算術演算は殆んどの場合,
; 限られた精度で実行される.
; それでわれわれのテストは非常に大きい数にも不適切である.
; 小さい数, 大きい数の場合, どのようにテストが失敗するかの例を使ってこのことを説明せよ.
; good-enough?を実装するもう一つの戦略は,
; ある繰返しから次へのguessの変化に注目し,
; 変化が予測値に比べ非常に小さくなった時に止めるのである.
; こういう終了テストを使う平方根手続きを設計せよ.
; これは小さい数, 大きい数に対してうまく働くか.

; ■非常に小さい数
; (square guess)が許容値で使用している0.001よりも小さくなる場合、
; 無条件でtrueが返されるので、(square guess)が0.001以下になるような被開平数に関しては、
; 正常な計算ができずほぼ同じような結果になってしまう。
; (sqrt 0.000001)

; ■非常に大きい数
; 例えば被開平数を200000000000000000000にすると、
; good-enough?が真にならず無限ループするらしい。
; >大きな数値間の差を取ることで有効桁数が落ちて許容値以下にならなくなってしまうため、無限ループになってしまう。
; らしいのだけど、よくわからん。有効桁数を超えた場合同処理されるのかを勉強する必要がある。

; good-enough?改善ver

(define (sqrt-iter2 new-guess old-guess x)
  (if (good-enough2? new-guess old-guess)
    new-guess
    (sqrt-iter2 (improve new-guess x) new-guess x)))

(define (good-enough2? new-guess old-guess)
  (< (abs(- new-guess old-guess)) 0.0001))

(define (sqrt2 x)
  (sqrt-iter2 1.0 0 x))
