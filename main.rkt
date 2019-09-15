#lang racket

(provide (except-out 
           (all-from-out racket)
           #%module-begin)
         (rename-out 
           [my-begin #%module-begin])
         tester-cube  )

(require syntax/parse/define
         "./lang/main.rkt"
         fragments)

(module reader syntax/module-reader
  fragments-first)

(define-syntax (my-begin stx)
  (syntax-parse stx
    #:datum-literals (world)
    [(_ all ... (world things ...)) 
     #`(#%module-begin
        all ...
        (world things ...))]
    
    [(_ all ...)
     #`(#%module-begin
        all ...)]))

;TODO: Remove boilerplate above

;Leave only...
(define (world . things)
  ;Hard code things players cannot change
  (apply serve 
    (append 
     (list
      (fpc 0 10 0)
      (tester-cube 0 0 0))
      things))


  (launch)
  
  ;Ummm... Yeah no...
  ;  * Also, auto pull from master (or current branch...)?
  (sleep 100000000))

(define (tester-cube x y z)
  (entity TesterCube
          (SetPosition To x y z)))
