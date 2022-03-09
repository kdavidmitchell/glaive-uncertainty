;;; A domain to demonstrate how uncertainty can impact simple stories - MuRDeR My$Tery
;;; Created by (2022)

;;; Hannah was missing for quite some time now. The police looked for her at her house, her parents' house, her partner's house and at the the storage facility. She was found dead in the lake near her neighbor's house. The police is suspecting her new neighbor and an uncle of hers. They found the knife at the neighbor's house. 

(define (domain murder)
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

        ;; Story specific predicates.
        (has-committed-murder ?murderer - character)
        (missing ?victim - character)
        (has-hidden-weapon ?murderer - character)
        (has-fled-scene ?murderer - character)
        (has-found-body ?police - character)
        (has-found-weapon ?police - character)
        (has-solved-murder ?police - character)
        (is-crime-scene ?place - place)
        (is-weapon-location ?place - place)
    )

    ;; A character moves to a place.
    (:action move-to-place
        :parameters (?character - character ?place - place)
        :precondition 
            (and 
                (not (at ?character ?place))
            )
        :effect 
            (and 
                (at ?character ?place)
                (believes ?character (at ?character ?place))
            )
        :fail
            (and
                (not (at ?character ?place))
                (believes ?character (not (at ?character ?place)))
            )
        :agents (?character)
    )

    ;; Murderer kills victim at a specific location with a specific murder weapon.
    (:action murder
        :parameters  (?murderer - character ?victim - character ?place - place ?weapon - thing)
        :precondition
            (and
                (at ?victim ?place)
                (at ?murderer ?place)
                (in ?weapon ?place)
            )
        :effect
            (and
                (dead ?victim)   ;;victim is dead
                (missing ?victim) ;; victim is also now missing
                (believes ?murderer (dead ?victim)) ;;murderer believes that the victim is dead
                (believes ?victim (dead ?victim))  ;;victim believes that the victim is dead
                (has-committed-murder ?murderer)
                (has ?murderer ?weapon)
                (is-crime-scene ?place)
                (believes ?murderer (has-committed-murder ?murderer))
                (believes ?murderer (has ?murderer ?weapon))
                (believes ?murderer (is-crime-scene ?place))
            )
        :fail
            (not (dead ?victim))    ;;????
        :agents (?murderer)
    )

    ;; Murderer moves the weapon from the crime scene to another place.
    (:action hide-the-murder-weapon
        :parameters (?murderer - character ?weapon - thing ?place - place)
        :precondition 
            (and
                (has-committed-murder ?murderer) 
                (has ?murderer ?weapon)
                (not (is-crime-scene ?place))
                (at ?murderer ?place)
            )
        :effect 
            (and
                (in ?weapon ?place)
                (not (has ?murderer ?weapon))
                (has-hidden-weapon ?murderer)
                (is-weapon-location ?place)
                (believes ?murderer (at ?murderer ?place))
                (believes ?murderer (in ?weapon ?place))
                (believes ?murderer (not (has ?murderer ?weapon)))
                (believes ?murderer (has-hidden-weapon ?murderer))
                (believes ?murderer (is-weapon-location ?place))
            )
        :fail
            (and
                (has ?murderer ?weapon)
                (not (has-hidden-weapon ?murderer))
            )
        :agents (?murderer)
    )

    ;; Murderer flees the scene s.t. they are not where the murder took place, nor where they hid the weapon.
    (:action flee-scene
        :parameters (?murderer - character ?place1 - place ?place2 - place)
        :precondition 
            (and
                (has-committed-murder ?murderer)
                (has-hidden-weapon ?murderer) 
                (at ?murderer ?place1)
                (not (is-crime-scene ?place2))
                (not (is-weapon-location ?place2))
            )
        :effect 
            (and
                (not (at ?murderer ?place1))
                (at ?murderer ?place2)
                (has-fled-scene ?murderer)
                (believes ?murderer (not (at ?murderer ?place1)))
                (believes ?murderer (at ?murderer ?place2))
                (believes ?murderer (has-fled-scene ?murderer))
            )
        :fail
            (and
                (not (has-fled-scene ?murderer))
            )
        :agents (?murderer)
    )

    ; ;; Police search for the victim.
    ; (:action search-for-victim-in-place
    ;     :parameters  (?police - character ?victim - character ?place - place)
    ;     :precondition
    ;         (and
    ;             (missing ?victim)
    ;             (at ?police ?place)
    ;         )
    ;     :effect
    ;         (and
    ;             (has ?police ?victim)
    ;             (not (at ?victim ?place))
    ;             (believes ?police (at ?victim ?place))
    ;             (not (believes ?police (not (at ?victim ?place))))
    ;         )
    ;     :fail
    ;         (not (believes ?police (at ?victim ?place)))
    ;     :agents (?police)
    ; )

    ; ;;Police searching for weapon
    ; (:action search-for-evidence
    ;     :parameters  (?police - character ?evidence - thing ?place - place)
    ;     :precondition
    ;         (and
    ;             (at ?police ?place)
    ;             (in ?evidence ?place)
    ;         )
    ;     :effect
    ;         (and
    ;             (has ?police ?evidence)
    ;             (not (in ?evidence ?place))
    ;             (believes ?police (has ?police ?evidence))
    ;             (not (believes ?police (not (has ?police ?evidence))))
    ;             (not (believes ?police (in ?evidence ?place)))
    ;         )
    ;     :fail
    ;         (not (believes ?police (in ?evidence ?place)))
    ;     :agents (?police)
    ; )

    ; ;; Police have built a case: they have a suspect, they know where the body is, and they have found the murder weapon.
    ; (:action solve-the-murder
    ;     :parameters (?police - character ?suspect - character)
    ;     :precondition 
    ;         (and
    ;             (believes ?police (has-committed-murder ?suspect)) 
    ;             (has-found-body ?police)
    ;             (has-found-weapon ?police)
    ;             (has-committed-murder ?suspect)
    ;         )
    ;     :effect 
    ;         (and 
    ;             (has-solved-murder ?police)
    ;         )
    ;     :fail
    ;         (not (has-solved-murder ?police))
    ;     :agents (?police)
    ; )
    

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