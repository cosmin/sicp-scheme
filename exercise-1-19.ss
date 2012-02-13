(define (sq x) (* x x))

;; Tpq(a, b) => (b*q + a*q + a*p), (b*p + a*q)
;;
;; Tpq(Tpq(a, b)) => ((b*p + a*q)*q + (b*q + a*q + a*p)*q + (b*q + a*q + a*p)*p),
;;                   ((b*p + a*q)*p + (b*q + a*q + a*p)*q)
;;
;; in order to find p' and q' we can start with the second part of the
;; transform, expand the multiplication and factor out and and b
;;
;; ((b*p + a*q)*p + (b*q + a*q + a*p)*q) =>
;; (b*p^2 + a*q*p + b*q^2 + a*q^2 + a*p*q =>
;; b*(p^2 + q^2) + a*(q^2 + 2*p*q)
;;
;; p' = (p^2 + q^2)
;; q' = (q^2 + 2*p*q)
;;
;; let's verify the above is correct by expanding out the first part
;;
;; ((b*p + a*q)*q + (b*q + a*q + a*p)*q + (b*q + a*q + a*p)*p) =>
;; b*p*q + a*q^2 + b*q^2 + a*q^2 + a*p*q + b*q*p + a*q*p + a*p^2 =>
;; b*(q^2 + 2*p*q) + a*(q^2 + 2*p*q) + a*(p^2 + q^2)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (sq p) (sq q))
                   (+ (sq q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

;; let's verify by comparing against the slower fib

(define (slow-fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (slow-fib (- n 1))
     (slow-fib (- n 2))))))

(= (fib 0) (slow-fib 0))
(= (fib 1) (slow-fib 1))
(= (fib 10) (slow-fib 10))
