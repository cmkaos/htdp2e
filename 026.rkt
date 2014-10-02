;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |026|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 26
; Define constants for the price optimization program so that the price sensitivity of attendance (15 people for every 10 cents) becomes a computed constant.

; Constants
(define ATTENDANCE 120)
(define TICKET-PRICE 5.0)
(define PEOPLE 15)
(define  STEP 0.1)
(define PRICE-SENSITIVITY (/ PEOPLE STEP))
(define COSTS-PER-CUSTOMER 1.50)


(define (attendees ticket-price)
      (- ATTENDANCE (* (- ticket-price TICKET-PRICE) (PRICE-SENSITIVITY))))