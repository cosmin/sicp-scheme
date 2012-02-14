(define runtime current-inexact-milliseconds)
(define (square x) (* x x))
(define (even? n) (= 0 (remainder n 2)))

(define (expmod base exp m)
  (define (square-check n)
    (cond ((and (not (= n 1))
                (not (= n (- m 1)))
                (= (remainder (* n n) m) 1))
           0)
          (else (* n n))))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-check (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin n)
  (define (try-it a)
    (= 1 (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin n) (fast-prime? n (- times 1)))
        (else false)))

;; check carmichael numbers

(fast-prime? 561  100) ; => #f
(fast-prime? 1105 100) ; => #f
(fast-prime? 1729 100) ; => #f
(fast-prime? 2465 100) ; => #f
(fast-prime? 2821 100) ; => #f
(fast-prime? 6601 100) ; => #f

;; check known primes from first exercise

(fast-prime? 1009 100)     ; => #t
(fast-prime? 1013 100)     ; => #t
(fast-prime? 1019 100)     ; => #t
(fast-prime? 10007 100)    ; => #t
(fast-prime? 10009 100)    ; => #t
(fast-prime? 10037 100)    ; => #t
(fast-prime? 100003 100)   ; => #t
(fast-prime? 100019 100)   ; => #t
(fast-prime? 100043 100)   ; => #t
(fast-prime? 1000003 100)  ; => #t
(fast-prime? 1000033 100)  ; => #t
(fast-prime? 1000037 100)  ; => #t
