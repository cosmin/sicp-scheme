(define (square x) (* x x))

(define (improve guess target)
  (/ (+ (/ target (square guess)) (* 2 guess))
     3))

(define (good-enough? old-guess new-guess)
  (< (abs (- old-guess new-guess)) (* old-guess 0.0001)))

(define (cube-root x)
  (cube-iter 0 1.0 x))

(define (cube-iter old-guess new-guess target)
  (if (good-enough? old-guess new-guess)
      new-guess
      (cube-iter new-guess (improve new-guess target) target)))

(cube-root 8)
