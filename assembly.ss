(define (set-mem20 x) ($ 20 x))

(define (increment-mem20) (set-mem20 (ADD (@ 20) 1)))

(define mem20 (@ 20))

(define sender 0x40)

(START
  ($ sender (CALLER))
  (FOR (set-mem20 0) (LT mem20 100) (increment-mem20)
	   (SEQ 1))
  (RETURN sender 32)
)
