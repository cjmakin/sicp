;Exercise 1.19 - Fibonacci number generator. Iterative in logarithmic number of steps.

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib-log n)
  (fib-log-iter 1 0 0 1 n))

(define (fib-log-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-log-iter
                   a
                   b
                   (+ (* p p) (* q q))       
                   (+ (* p q) (* q q) (* q p))   
                   (/ count 2)))
        (else (fib-log-iter
                        (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
