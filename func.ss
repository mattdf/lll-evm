;(func mult (a b) 'ret 'int256)

(define (inc-frame f)
  ($ 0 (ADD (@ 0) (MUL 32 f))))

(define (dec-frame f)
  ($ 0 (SUB (@ 0) (MUL 32 f))))

(define (frame addr val)
  ($ (SUB (@ 0) (MUL addr 32)) val))

(define (frame-load addr)
  (@ (SUB (@ 0) (MUL addr 32))))

(define mult-label (label-counter-create))

(define (mult a b)
  (SEQ
	(inc-frame 2)
    (frame 0 a)
    (frame 1 b)
	(MUL (frame-load 0) (frame-load 1))
    (dec-frame 2)))

(define size 32)
(define mem-offset 32)

(START
  ($ mem-offset (mult 4 4))
  (RETURN mem-offset size)
)
