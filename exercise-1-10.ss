(define (A* m n)
  (cond ((= m 0) (+ 1 n))
        ((= n 0) (A (- 1 m) 1))
        (else (A (- 1 m)
                 (A m (- 1 n))))))

(define (A x y) 
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) 
                 (A x (- y 1))))))

; (A 2 2) => (A 1 (A 2 1)) => (A 1 2) => (A 0 (A 1 1)) => (A 0 2) => 4

; (A 2 3) => (A 1 (A 2 2)) => (A 1 4) => (A 0 (A 1 3)) => (A 0 8) => 16
; (A 1 3) => (A 0 (A 1 2)) => (A 0 4) => 8

; (A 2 4) => (A 1 (A 2 3)) => (A 1 16) => (A 0 (A 1 15)) =>

; (A 2 5) => (A 1 (A 2 4)) =>

; (A 2 n) => (A 1 (A 2 (- n 1)))

(A 1 10) 
(A 2 4) 
(A 3 3)

(define (pow x y)
  (define (pow-iter acc y)
    (cond ((= y 0) 1)
          ((= y 1) acc)
          (else (pow-iter (* acc x) (- y 1)))))
  (pow-iter x y))

(pow 2 0)
(pow 2 1)
(pow 2 2)
(pow 2 3)

(define (f n) (A 0 n)) ;  f(n)= 2 * n
(define (g n) (A 1 n)) ;  g(n)= 2 ^ n 
(define (h n) (A 2 n)) ;  h(n)= 2 ^ (2 ^ ..)

; 

(= (f 4) (* 2 4))
(= (g 4) (pow 2 4))
(= (h 4) (pow 2 (pow 2 (pow 2 2))))

(define (k n) (* 5 n n))

