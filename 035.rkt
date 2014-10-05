;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |035|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 35
; Develop your favorite image of a car so that WHEEL-RADIUS remains the single point of control.

; Physical Constants
(define WHEEL-RADIUS 5) ; single point of control

; Graphical Constants
(define WHEEL (overlay (circle (/ WHEEL-RADIUS 2) "solid" "LightGray")
                       (circle WHEEL-RADIUS "solid" "black")))
(define SPACE (rectangle (* 2 WHEEL-RADIUS) WHEEL-RADIUS 0 "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define BODY-TOP (rectangle (* 4 WHEEL-RADIUS) WHEEL-RADIUS 255 "red"))
(define BODY-BOTTOM (rectangle (* 8 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) 255 "red"))
(define CAR (above BODY-TOP
                   (underlay/offset BODY-BOTTOM
                            0 WHEEL-RADIUS
                            BOTH-WHEELS)))

CAR