(define runtime current-inexact-milliseconds)
(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

;; from 1.22

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (newline)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (even? n) (= 0 (remainder n 2)))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ start 1) end) ; skip evens
      (cond ((< start end) (timed-prime-test start)
                           (search-for-primes (+ start 2) end)))))

;; new code for 1.23

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

;; old results

; > (search-for-primes 1000000 1000060)
; 1000003 *** 0.140869140625
; 1000033 *** 0.112060546875
; 1000037 *** 0.09716796875

;; new results

; > (search-for-primes 1000000 1000060)
; 1000003 *** 0.06103515625
; 1000033 *** 0.06005859375
; 1000037 *** 0.06103515625

;; the new code is close to 2x faster. This might be due to invoking
;; next being more expensive than directly invoking +
