#lang racket

(provide (except-out 
           (all-from-out racket)
           #%module-begin)
         (rename-out 
           [my-begin #%module-begin]))

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

(define (world . things)
  ;Hard code things players cannot change
  (displayln things))


