(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

;

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))))

; (plus 2 2) => (inc (inc 2)) => 4
; this is a linear recursive process

(define (plus* a b)
  (if (= a 0)
      b
      (plus* (dec a) (inc b))))

; (plus* 2 2) => (plus* 1 3) => (plus* 0 4) => 4
; this is an iterative process
