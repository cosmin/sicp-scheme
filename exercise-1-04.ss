(define (a-plus-abs-b a b) 
  ((if (> b 0) + -) a b))

; if b is greater than 0 then the function will compute a + b
; otherwise it will compute a - b