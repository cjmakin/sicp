;; Exercise 1.36:
; Modify fixed-point so that it prints the sequence of approximations it generates.
; Then find a solution to x^x = 1000 by finding a fixed point of x -> log(1000)/ log(x).
;
; Compare the number of steps this takes with and without average damping.

(define tolerance 0.00001)

(define (average a b)
  (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))  
  (try first-guess))

; With average damping. Number of guesses: 8
(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
             2.0)

(newline)

; Without. Number of guesses: 33
(fixed-point (lambda (x) (/ (log 1000) (log x)))
             2.0)
