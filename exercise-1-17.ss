(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))

;; pretend the following are built-in

(define (double a) (* a 2))

(define (halve a) (/ a 2))

(define (even? n) (= (remainder n 2) 0))

;; fast-multiplication -- log(n) steps

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))
