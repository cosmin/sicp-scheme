;; pretend built-ins

(define (double a) (* a 2))

(define (halve a) (/ a 2))

(define (even? n) (= (remainder n 2) 0))


;; iterative fast-mul

(define (mul a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a b acc)
  (cond ((= b 0) acc)
        ((even? b) (fast-mul-iter (double a) (halve b) acc))
        (else (fast-mul-iter a (- b 1) (+ acc a)))))
