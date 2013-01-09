;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname contains) (read-case-sensitive #t) (teachpacks ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.ss" "teachpack" "2htdp") (lib "image.ss" "teachpack" "2htdp")))))
; Exercises 113-115

; A List-of-names is one of:
; - empty
; - (cons String List-of-names)
; interp. a List-of-names represents a list of invitees by last name

; Examples

; List-of-names -> Boolean
; to determine whether "Flatt" occurs on a-list-of names
(check-expect (contains-flatt? empty) false)
(check-expect (contains-flatt? (cons "Findler" empty)) false)
(check-expect (contains-flatt? (cons "Flatt" empty)) true)
(check-expect 
  (contains-flatt? (cons "Mur" (cons "Fish"  (cons "Find" empty)))) 
  false) 
(check-expect 
  (contains-flatt? (cons "A" (cons "Flatt" (cons "C" empty)))) 
  true)

(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) false]
    [else (or (string=? (first a-list-of-names) "Flatt")
          (contains-flatt? (rest a-list-of-names)))]))
