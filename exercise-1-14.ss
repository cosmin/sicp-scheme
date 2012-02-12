(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


;; required space grows linearly with the size of the input as the
;; tree height is equal to the amount (more precisely amount divided
;; by lowest denomination).

;; number of operations is amount ^ number-of-coins, or amount ^ 5 in
;; our specific example.

;; see the far more detailed explanation at
;; http://www.billthelizard.com/2009/12/sicp-exercise-114-counting-change.html
