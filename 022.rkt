;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |022|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 22
; Define the function string-delete, which consumes a string and a number i and which deletes the ith position from str. Assume i is a number between 0 (inclusive) and the length of the given string (exclusive).

(define (string-delete string i)
  (string-append (substring string 0 i) (substring string (add1 i))))

(string-delete "helloworld" 5)