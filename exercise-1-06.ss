(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2 ))

(define (good-enough? old-guess guess)
  (< (abs (- old-guess guess)) (* old-guess 0.001)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1 10)

; sqrt-iter will recurse infinitely because sqrt-iter will be evaluated before
; calling new-if since new-if is a function and follows applicative order eval