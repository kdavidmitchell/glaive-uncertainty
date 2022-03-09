
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The domain "murder", compiled for use in planners               ;;;
;;;  that support intention.                                        ;;;
;;;                                                                 ;;;
;;; Compilation by Matthew Christensen and Jennifer Nelson (2020)   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain murder-bompiled)
    (:requirements :adl :universal-preconditions :expression-variables :intentionality :disjunctive-preconditions :negative-preconditions)
    (:types
    
character place thing

    )
    (:predicates
        (has ?char - character ?thing - thing)
		(in ?thing - thing ?place - place)
		(at ?character - character ?place - place)
		(dead ?char - character)
		(has-committed-murder ?murderer - character)
		(missing ?victim - character)
		(has-hidden-weapon ?murderer - character)
		(has-fled-scene ?murderer - character)
		(has-found-body ?police - character)
		(has-found-weapon ?police - character)
		(has-solved-murder ?police - character)
		(is-crime-scene ?place - place)
		(is-weapon-location ?place - place)
		(believes_not_has ?who - character ?char - character ?thing - thing)
		(believes_has ?who - character ?char - character ?thing - thing)
		(believes_not_in ?who - character ?thing - thing ?place - place)
		(believes_in ?who - character ?thing - thing ?place - place)
		(believes_not_at ?who - character ?character - character ?place - place)
		(believes_at ?who - character ?character - character ?place - place)
		(believes_not_dead ?who - character ?char - character)
		(believes_dead ?who - character ?char - character)
		(believes_not_has-committed-murder ?who - character ?murderer - character)
		(believes_has-committed-murder ?who - character ?murderer - character)
		(believes_not_missing ?who - character ?victim - character)
		(believes_missing ?who - character ?victim - character)
		(believes_not_has-hidden-weapon ?who - character ?murderer - character)
		(believes_has-hidden-weapon ?who - character ?murderer - character)
		(believes_not_has-fled-scene ?who - character ?murderer - character)
		(believes_has-fled-scene ?who - character ?murderer - character)
		(believes_not_has-found-body ?who - character ?police - character)
		(believes_has-found-body ?who - character ?police - character)
		(believes_not_has-found-weapon ?who - character ?police - character)
		(believes_has-found-weapon ?who - character ?police - character)
		(believes_not_has-solved-murder ?who - character ?police - character)
		(believes_has-solved-murder ?who - character ?police - character)
		(believes_not_is-crime-scene ?who - character ?place - place)
		(believes_is-crime-scene ?who - character ?place - place)
		(believes_not_is-weapon-location ?who - character ?place - place)
		(believes_is-weapon-location ?who - character ?place - place)
    )
    
(:action move-to-place_success
    :parameters   ( ?character - character ?place - place)
    :precondition 
		(and  
			(not  
				(at ?character ?place)
			)
			(believes_not_at ?character ?character ?place)
		)
    :effect
		(and  
			(at ?character ?place)
			(believes_at ?character ?character ?place)
		)    


    :agents (?character)
)

	
(:action move-to-place_fail
    :parameters   ( ?character - character ?place - place)
    :precondition 
		(and  
			(at ?character ?place)
			(believes_not_at ?character ?character ?place)
		)
    :effect
		(and  
			(not  
				(at ?character ?place)
			)
			(believes_not_at ?character ?character ?place)
		)    


    :agents (?character)
)

	
(:action murder_success
    :parameters   ( ?murderer - character ?victim - character ?place - place ?weapon - thing)
    :precondition 
		(and  
			(at ?victim ?place)
			(at ?murderer ?place)
			(in ?weapon ?place)
			(believes_at ?murderer ?victim ?place)
			(believes_at ?murderer ?murderer ?place)
			(believes_in ?murderer ?weapon ?place)
		)
    :effect
		(and  
			(dead ?victim)
			(missing ?victim)
			(believes_dead ?murderer ?victim)
			(believes_dead ?victim ?victim)
			(has-committed-murder ?murderer)
			(has ?murderer ?weapon)
			(is-crime-scene ?place)
			(believes_has-committed-murder ?murderer ?murderer)
			(believes_has ?murderer ?murderer ?weapon)
			(believes_is-crime-scene ?murderer ?place)
		)    


    :agents (?murderer)
)

	
(:action murder_fail
    :parameters   ( ?murderer - character ?victim - character ?place - place ?weapon - thing)
    :precondition 
		(and  
			(or  
				(not  
					(at ?victim ?place)
				)
				(not  
					(at ?murderer ?place)
				)
				(not  
					(in ?weapon ?place)
				)
			)
			(believes_at ?murderer ?victim ?place)
			(believes_at ?murderer ?murderer ?place)
			(believes_in ?murderer ?weapon ?place)
		)
    :effect
		(not  
			(dead ?victim)
		)    


    :agents (?murderer)
)

	
(:action hide-the-murder-weapon_success
    :parameters   ( ?murderer - character ?weapon - thing ?place - place)
    :precondition 
		(and  
			(has-committed-murder ?murderer)
			(has ?murderer ?weapon)
			(not  
				(is-crime-scene ?place)
			)
			(at ?murderer ?place)
			(believes_has-committed-murder ?murderer ?murderer)
			(believes_has ?murderer ?murderer ?weapon)
			(believes_not_is-crime-scene ?murderer ?place)
			(believes_at ?murderer ?murderer ?place)
		)
    :effect
		(and  
			(in ?weapon ?place)
			(not  
				(has ?murderer ?weapon)
			)
			(has-hidden-weapon ?murderer)
			(is-weapon-location ?place)
			(believes_at ?murderer ?murderer ?place)
			(believes_in ?murderer ?weapon ?place)
			(believes_not_has ?murderer ?murderer ?weapon)
			(believes_has-hidden-weapon ?murderer ?murderer)
			(believes_is-weapon-location ?murderer ?place)
		)    


    :agents (?murderer)
)

	
(:action hide-the-murder-weapon_fail
    :parameters   ( ?murderer - character ?weapon - thing ?place - place)
    :precondition 
		(and  
			(or  
				(not  
					(has-committed-murder ?murderer)
				)
				(not  
					(has ?murderer ?weapon)
				)
				(is-crime-scene ?place)
				(not  
					(at ?murderer ?place)
				)
			)
			(believes_has-committed-murder ?murderer ?murderer)
			(believes_has ?murderer ?murderer ?weapon)
			(believes_not_is-crime-scene ?murderer ?place)
			(believes_at ?murderer ?murderer ?place)
		)
    :effect
		(and  
			(has ?murderer ?weapon)
			(not  
				(has-hidden-weapon ?murderer)
			)
		)    


    :agents (?murderer)
)

	
(:action flee-scene_success
    :parameters   ( ?murderer - character ?place1 - place ?place2 - place)
    :precondition 
		(and  
			(has-committed-murder ?murderer)
			(has-hidden-weapon ?murderer)
			(at ?murderer ?place1)
			(not  
				(is-crime-scene ?place2)
			)
			(not  
				(is-weapon-location ?place2)
			)
			(believes_has-committed-murder ?murderer ?murderer)
			(believes_has-hidden-weapon ?murderer ?murderer)
			(believes_at ?murderer ?murderer ?place1)
			(believes_not_is-crime-scene ?murderer ?place2)
			(believes_not_is-weapon-location ?murderer ?place2)
		)
    :effect
		(and  
			(not  
				(at ?murderer ?place1)
			)
			(at ?murderer ?place2)
			(has-fled-scene ?murderer)
			(believes_not_at ?murderer ?murderer ?place1)
			(believes_at ?murderer ?murderer ?place2)
			(believes_has-fled-scene ?murderer ?murderer)
		)    


    :agents (?murderer)
)

	
(:action flee-scene_fail
    :parameters   ( ?murderer - character ?place1 - place ?place2 - place)
    :precondition 
		(and  
			(or  
				(not  
					(has-committed-murder ?murderer)
				)
				(not  
					(has-hidden-weapon ?murderer)
				)
				(not  
					(at ?murderer ?place1)
				)
				(is-crime-scene ?place2)
				(is-weapon-location ?place2)
			)
			(believes_has-committed-murder ?murderer ?murderer)
			(believes_has-hidden-weapon ?murderer ?murderer)
			(believes_at ?murderer ?murderer ?place1)
			(believes_not_is-crime-scene ?murderer ?place2)
			(believes_not_is-weapon-location ?murderer ?place2)
		)
    :effect
		(not  
			(has-fled-scene ?murderer)
		)    


    :agents (?murderer)
)

)

