;;; A domain to demonstrate how uncertainty can impact simple stories - MuRDeR My$Tery
;;; Created by (2022)

;;; Hannah was missing for quite some time now. The police looked for her at her house, her parents' house, her partner's house and at the the storage facility. She was found dead in the lake near her neighbor's house. The police is suspecting her new neighbor and an uncle of hers. They found the knife at the neighbor's house. 

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
        (dead ?char - character)
        ; has committed murder
        (has-committed-murder ?murderer - character)
    )

    ;; Police searching for hannah
    (:action search-for-hannah
        :parameters  (?police - character ?hannah - character ?place - place)
        :precondition
            (and
                (at ?police ?place)
                (at ?hannah ?place)
            )
        :effect
            (and
                (has ?police ?hannah)
                (not (in ?hannah ?place))
                (believes ?police (in ?hannah ?place))
                (not (believes ?police (not (in ?hannah ?place))))
            )
        :fail
            (not (believes ?police (in ?hannah ?place)))
        :agents (?police)
    )

    ;; Murderer murdering the victim
    (:action murder
        :parameters  (?murderer - character ?victim - character)
        :precondition
            (not (dead ?murderer)) ;;murderer is not dead
        :effect
            (and
                (dead ?victim)   ;;victim is dead
                (believes ?murderer (dead ?victim)) ;;murderer believes that the victim is dead
                (believes ?victim (dead ?victim))  ;;victim believes that the victim is dead
                (has-committed-murder ?murderer)
            )
        :fail
            (not (dead ?victim))    ;;????
        :agents (?murderer)
    )

    ;;Police searching for weapon
    (:action search-for-evidence
        :parameters  (?police - character ?evidence - thing ?place - place)
        :precondition
            (and
                (at ?police ?place)
                (in ?evidence ?place)
            )
        :effect
            (and
                (has ?police ?evidence)
                (not (in ?evidence ?place))
                (believes ?police (has ?police ?evidence))
                (not (believes ?police (not (has ?police ?evidence))))
                (not (believes ?police (in ?evidence ?place)))
            )
        :fail
            (not (believes ?police (in ?evidence ?place)))
        :agents (?police)
    )

    ;; hide-evidence
    ;; police finding the suspect 
    ;; 

    ; character - Hanna, Police, Uncle, Neighbor
    ; place - house, parents-house, partner-house, storage-facility, neighbor-house, uncle-house
    ; thing - knife

    ;; goal state - murderer intends dead(victim) (action - murder)

    ; (:action suspect
    ;     :parameters  (?character1 - character ?character2 - character2)
    ;     :precondition
    ;         (not (found ?character2)) ;;murderer is not dead
    ;     :effect
    ;         (and
    ;             (dead ?victim)   ;;victim is dead
    ;             (believes ?murderer (dead ?victim)) ;;murderer believes that the victim is dead
    ;             (believes ?victim (dead ?victim))  ;;victim believes that the victim is dead
    ;         )
    ;     :fail
    ;         (not (dead ?victim))    ;;????
    ;     :agents (?murderer)
    ; )
)