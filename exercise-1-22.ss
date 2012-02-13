(define runtime current-inexact-milliseconds)
(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

;; given

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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

;; search-for-primes

(define (even? n) (= 0 (remainder n 2)))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ start 1) end) ; skip evens
      (cond ((< start end) (timed-prime-test start)
                           (search-for-primes (+ start 2) end)))))


;; results

; > (search-for-primes 1000 1020)
; 1009 *** 0.0068359375
; 1013 *** 0.007080078125
; 1019 *** 0.006103515625

; average => 0.006673177083333333

; > (search-for-primes 10000 10050)
; 10007 *** 0.01806640625
; 10009 *** 0.01806640625
; 10037 *** 0.01904296875

;; average => 0.018391927083333332

; > (search-for-primes 100000 100050)
; 100003 *** 0.053955078125
; 100019 *** 0.053955078125
; 100043 *** 0.05322265625

;; average => 0.0537109375

; > (search-for-primes 1000000 1000060)
; 1000003 *** 0.140869140625
; 1000033 *** 0.112060546875
; 1000037 *** 0.09716796875

;; average => 0.11669921875

;; ratios => 2.75, 2.92, 2.17
;; expected ratio is 3.16

;; the numbers seem consistent with the expections, however there is a
;; lot of noise in the measurements that can explain the difference
