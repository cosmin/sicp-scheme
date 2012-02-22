(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* h k))))
  (define (mul k) (if (or (= 0 k) (= n k)) 1
                      (if (even? k) 2 4)))
  (define (term k) (* (mul k) (y k)))
  
  (* (/ h 3.0)
     (sum term 0 inc n)))
