#lang fragments-first

(define (hello x z)
  (tester-cube x 0 z))

(world
 (hello 1 0)
 (hello -1 0)
 (hello 0 1)
 (hello 0 -1)) 
