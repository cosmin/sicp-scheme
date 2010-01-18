(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2 ))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) (* old-guess 0.001)))

(define (sqrt* x)
  (square-iter 0 1.0 x))

(define (square-iter old-guess guess target)
  (if (good-enough? old-guess guess)
      guess
      (square-iter guess (improve guess target) target)))

(sqrt 2)
(sqrt 1241324123847120938471234)