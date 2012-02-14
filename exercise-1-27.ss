(define runtime current-inexact-milliseconds)
(define (square x) (* x x))
(define (even? n) (= 0 (remainder n 2)))

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
  (test-all-starting-with n (- n 1)))

;; let's test the first 6 Carmichael numbers

(prime? 561)  ;=> #t
(prime? 1105) ;=> #t
(prime? 1729) ;=> #t
(prime? 2465) ;=> #t
(prime? 2821) ;=> #t
(prime? 6601) ;=> #t
