(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))


(test 0 (p))

; if the interpreter is using applicative ordering then before test is called
; p will be called, and p will cause infinite recursion
;
; if the interpreter is using normal evaluation order then p will not be
; evaluated when calling (test 0 (p)) because test will return 0