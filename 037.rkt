;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |037|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 37
; Design a program that moves a car across the world canvas, from left to right, at the rate of three pixels per clock tick.

;;; CONSTANTS

; car image :
(define WHEEL-RADIUS 5) ; single point of control of all images sizes (CAR, TREE, BACKGROUND).

(define WHEEL (overlay (circle (/ WHEEL-RADIUS 2) "solid" "LightGray")
                       (circle WHEEL-RADIUS "solid" "black")))
(define SPACE (rectangle (* 2 WHEEL-RADIUS) WHEEL-RADIUS "solid" "transparent"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define BODY-TOP (rectangle (* 4 WHEEL-RADIUS) WHEEL-RADIUS "solid" "red"))
(define BODY-BOTTOM (rectangle (* 8 WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red"))

(define CAR (above BODY-TOP
                   (underlay/offset BODY-BOTTOM
                            0 WHEEL-RADIUS
                            BOTH-WHEELS)))
; tree image :
(define TREE
  (above (circle (/ (image-height CAR) 2) "solid" "green")
         (rectangle (/ (image-height CAR) 10) (image-height CAR) "solid" "brown")))
(define WS (rectangle (/ (image-height CAR) 2) (/ (image-height CAR) 10) "solid" "transparent")) ; WS is for WHITE-SPACE: for placing multiple trees separated by a space

; background image :
(define WIDTH-OF-WORLD (* (image-width CAR) 7.5))
(define HEIGHT-OF-WORLD (* (image-height CAR) 1.2))
(define BACKGROUND (place-image
                    (beside TREE WS TREE WS TREE WS TREE WS TREE WS TREE WS TREE WS TREE WS TREE WS TREE)
                    (* WIDTH-OF-WORLD 0.5) (* HEIGHT-OF-WORLD 0.5)
                    (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD)))

; car's y position :
(define Y-CAR (- HEIGHT-OF-WORLD (/ (image-height CAR) 2)))

;;; DATA DEFINITION

; WorldState is a Number
; the number of clock ticks that have passed

;; WORLD FUNCTIONS

; render :
; WorldState -> Image
; places the car into a scene according to the given world state
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))
 
; clock-tick-handler : 
; WorldState -> WorldState
; moves the car by three pixels every time the clock ticks
; example:
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock ws)
  (+ ws 3))

; main :
; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
   (big-bang ws
             [on-tick tock]
             [to-draw render]
             (stop-when end?)))

; end? :
; WorldState -> Boolean
; stops the animation when the car has disappeared on the right side of the canvas
(check-expect (end? (- WIDTH-OF-WORLD (image-width CAR))) false)
(check-expect (end? (+ WIDTH-OF-WORLD (image-width CAR) 1)) true)
(define (end? ws) (< (+ WIDTH-OF-WORLD (image-width CAR)) ws))

;;; LAUNCH

(main 0)