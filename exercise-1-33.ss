(define (inc x) (+ x 1))
(define (identity x) x)

;; from exercise 1.20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; from exercise 1.27

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (test-all-starting-with n a)
  (cond ((= a 0) true)
        ((fermat-test n a) (test-all-starting-with n (- a 1)))
        (else false)))

(define (prime? n)
  (if (> n 1)
      (test-all-starting-with n (- n 1))
      #f))


;; exercise

(define (filtered-accumulate combiner filter? null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter? a)
                  (combiner (term a) result)
                  result))))
  (iter a null-value))



(define (sum-square-of-primes a b)
  (filtered-accumulate + prime? 0 square a inc b))

(= 87 (sum-square-of-primes 1 10))

(define (sum-relatively-prime-less-then n)
  (define (relatively-prime? x) (= 1 (gcd x n)))
  (filtered-accumulate + relatively-prime? 0 identity 1 inc (- n 1)))

(= 20 (sum-relatively-prime-less-then 10)) ; (+ 1 3 7 9)
