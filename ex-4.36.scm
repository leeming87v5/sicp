;;; Exercise 4.36.  Exercise 3.69 discussed how to generate the stream of all
;;; Pythagorean triples, with no upper bound on the size of the integers to be
;;; searched.

;;; Explain why simply replacing an-integer-between by an-integer-starting-from
;;; in the procedure in exercise 4.35 is not an adequate way to generate
;;; arbitrary Pythagorean triples.

; The modified procedure would be:
;
;     (define (a-pythagorean-triples low)
;       (let ((i (an-integer-starting-from low)))
;         (let ((j (an-integer-starting-from i)))
;           (let ((k (an-integer-starting-from j)))
;             (require (= (+ (* i i) (* j j)) (* k k)))
;             (list i j k)))))
;
; And this version can be translated into C-like language as follows:
;
;     for (int i = low; ; i++)
;     {
;         for (int j = i; ; j++)
;         {
;             for (int k = j; ; k++)
;             {
;                 if (i * i + j * j != k * k)
;                     continue;
;                 emit(i, j, i);
;             }
;         }
;     }
;
; Thus, the most inner loop tries to enumerate infinite number of integers.  So
; that non-first candidates of i and j will never be enumerated.

;;; Write a procedure that actually will accomplish this. (That is, write
;;; a procedure for which repeatedly typing try-again would in principle
;;; eventually generate all Pythagorean triples.)

; TODO
