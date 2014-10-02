;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |023|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 23
; Refactor all magic numbers in sample code into constant definitions.

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

(profit 2.9)