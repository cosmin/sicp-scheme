(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; applicative order => remainder is evaluated 4 times
;; (gcd 206 40) =>
;; (gcd 40 (remainder 206 40)) =>
;; (gcd 6 (remainder 40 6)) =>
;; (gcd 4 (remainder 6 4)) =>
;; (gcd 2 (remainder 4 2)) =>
;; 2

;; normal order => remainder is evaluated 18 times
;; this gets messy quickly, see the full explanation 
;; http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html
