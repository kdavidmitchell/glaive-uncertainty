;;; A domain to demonstrate how uncertainty can impact simple stories
;;; Created by (2022)

(define (domain uncertainty)
    (:requirements :adl :universal-preconditions :expression-variables :belief)
    (:types
        character place thing
    )
    (:predicates
        ;; Basic predicates.
        (has ?char - character ?thing - thing)
        (in ?thing - thing ?place - place)
        (at ?character - character ?place - place)
    )

    ;; Basic operators for the story.
    (:action travel-to-characters-believed-location
        :parameters (?character1 - character ?character2 - character ?place - place)
        :precondition
            (and
                (not (at ?character1 ?place))
                (believes ?character1 (at ?character2 ?place))
            )
        :effect
            (and
                (at ?character1 ?place)
                (believes ?character1 (at ?character1 ?place))
            )
        :fail
            (and
                (not (at ?character1 ?place))
                (believes ?character1 (not (at ?character1 ?place)))
            )
        :agents
            (?character1)
    )
    
    (:action buy
        :parameters (?buyer - character ?seller - character ?place - place ?thing - thing)
        :precondition 
            (and
                (in ?thing ?place) 
                (at ?buyer ?place)
                (at ?seller ?place)
                (has ?seller ?thing)
            )
        :effect 
            (and 
                (has ?buyer ?thing)
                (not (has ?seller ?thing))
            )
        :fail
            (and
                (not (has ?buyer ?thing))
                (has ?seller ?thing)
            )
        :agents
            (?buyer)
    )

    ;; Experimental actions defined to extend belief system to handle uncertainty.
)
