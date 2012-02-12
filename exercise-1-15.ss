(define (cube x) (* x x x))

(define (p x) 
  (pretty-print 1)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))


;; each time we divide the angle by 3 until the angle is <= 0.1
;; 
;; 12.15 => 4.05 => 1.35 => 0.45 => 0.15 => 0.05
;;
;; therefore we call p 5 times to compute sine of 12.15

;; both the space and complexity of this operation is log(n) (base 3)
