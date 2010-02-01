(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-largest-squares a b c)
  (cond ((and (> a c) (> b c)) (sum-of-squares a b))
        ((and (> a b) (> c b)) (sum-of-squares a c))
        (else (sum-of-squares b c))))

(= (sum-of-largest-squares 3 4 5) 41)
(= (sum-of-largest-squares 3 4 4) 32)
(= (sum-of-largest-squares 3 3 5) 34)
(= (sum-of-largest-squares 3 3 3) 18)
