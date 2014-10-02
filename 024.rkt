;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |024|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 24
; Determine the potential profit for the following ticket prices: $1, $2, $3, $4, and $5. Determine the best ticket price down to a dime.

; Owner's experience
(define ATTENDANCE 120)
(define TICKET-PRICE 5.0)
(define PEOPLE 15)
(define  STEP 0.1)

; Costs
(define FIXED-COSTS 180)
(define COSTS-PER-CUSTOMER 0.04)


(define (attendees ticket-price)
      (- ATTENDANCE (* (- ticket-price TICKET-PRICE) (/ PEOPLE STEP))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
      (+ FIXED-COSTS (* COSTS-PER-CUSTOMER (attendees ticket-price))))

(define (profit ticket-price)
      (- (revenue ticket-price)
         (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3) ; this is the max profit up to a dollar
(profit 4)
(profit 5)

(profit 2.9) ; this is the max profit up to a dime
(profit 2.8)
(profit 2.7)
(profit 2.6)
(profit 2.5)