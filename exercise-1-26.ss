(define (even? n) (= 0 (remainder n 2)))

;; linear recursion
(define (expmod base exp m)
  (display ".")
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; tree recursion
(define (expmod base exp m)
  (display ".")
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


;; compared to using square, using inlined multiplication does not
;; result in twice as many calls to expmod. Instead it results in
;; exponential growth because the entire subtree has to be recomputed
;; twice at each level.
