;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |019|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 19
; Exercise 19. Define the function image-classify, which consumes an image and produces "tall" if the image is taller than it is wide, "wide" if it is wider than it is tall, or "square" if its width and height are the same.

(require 2htdp/image)

(define (image-classify image)
  (if (= (image-height image) (image-width image))
      "square"
      (if (> (image-height image) (image-width image))
          "tall"
          "wide")))


(image-classify (square 25 "solid" "blue"))