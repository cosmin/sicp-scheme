(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (producti term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (productr term a next b)
  (if (> a b)
      1
      (* (term a)
         (productr term (next a) next b))))

(define (product term a next b)
  (producti term a next b))

(= 216 (product cube 1 inc 3))

(define (identity x) x)

(define (factorial x)
  (product identity 1 inc x))

(= 120 (factorial 5))

(define (pi n)
  (define (term x)
    (if (even? x)
        (/ x (inc x))
        (/ (inc x) x)))
  (* 4.0
     (product term 2 inc n)))
