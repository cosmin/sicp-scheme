(define (pascal row column)
  (cond ((or (= column 1) (= column row)) 1)
        (else (+ (pascal (- row 1) (- column 1))
                 (pascal (- row 1) column)))))

(= (pascal 1 1) 1)
(= (pascal 2 2) 1)
(= (pascal 4 2) 3)