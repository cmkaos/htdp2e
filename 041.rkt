;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |041|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
; HtDP/2e. Exercise 41
; Look up the "2htdp/image" teachpack and find a way to create framed, left-aligned text. Then change the program in figure 12 so that it uses this combination of image primitives to render its state.

; physical constants:
            (define WIDTH 100)
            (define HEIGHT 30)
             
            ; graphical constant:
            (define MT (empty-scene WIDTH HEIGHT))
             
            ; AllKeys is a String.
            ; interpretation the keys pressed since big-bang created the canvas
             
            ; AllKeys -> Image
            ; renders the string as a text and place it into MT
             
            (check-expect (shaw "hel") (overlay/align "left" "middle" (text "hel" 11 "red") MT))
            (check-expect (shaw "mark") (overlay/align "left" "middle" (text "mark" 11 "red") MT))
             
            (define (shaw ak)
              (overlay/align "left" "middle"(text ak 11 "red") MT))

 ; AllKeys String -> AllKeys
            ; adds ke to ak, the state of the world
             
            (check-expect (remember "hello" " ") "hello ")
            (check-expect (remember "hello " "w") "hello w")
             
            (define (remember ak ke)
              (string-append ak ke))
             
           
; AllKeys -> AllKeys
            (define (main s)
              (big-bang s
                        [on-key remember]
                        [to-draw shaw]))
             

(main ">")