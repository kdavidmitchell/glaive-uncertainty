
(define (problem murder-bompiled)
    (:domain murder-bompiled)
    (:objects
        :objects
police - character
hannah - character
uncle - character
neighbor - character
hannah-house - place
uncle-house - place
neighbor-house - place
partner-house - place
storage-facility - place
knife - thing

    )
    (:init
        (not (is-crime-scene hannah-house))
	(not (is-crime-scene uncle-house))
	(not (is-crime-scene neighbor-house))
	(not (is-crime-scene partner-house))
	(not (is-crime-scene storage-facility))
	(not (is-weapon-location hannah-house))
	(not (is-weapon-location uncle-house))
	(not (is-weapon-location neighbor-house))
	(not (is-weapon-location partner-house))
	(not (is-weapon-location storage-facility))
	(believes_not_at neighbor neighbor hannah-house)
	(believes_not_at neighbor neighbor uncle-house)
	(believes_not_at neighbor neighbor partner-house)
	(believes_not_at neighbor neighbor storage-facility)
	(believes_not_is-crime-scene neighbor hannah-house)
	(believes_not_is-crime-scene neighbor uncle-house)
	(believes_not_is-crime-scene neighbor neighbor-house)
	(believes_not_is-crime-scene neighbor partner-house)
	(believes_not_is-crime-scene neighbor storage-facility)
	(believes_not_is-weapon-location neighbor hannah-house)
	(believes_not_is-weapon-location neighbor uncle-house)
	(believes_not_is-weapon-location neighbor neighbor-house)
	(believes_not_is-weapon-location neighbor partner-house)
	(believes_not_is-weapon-location neighbor storage-facility)
	(at hannah neighbor-house)
	(at neighbor neighbor-house)
	(in knife neighbor-house)
	(believes_at neighbor neighbor neighbor-house)
	(believes_in neighbor knife neighbor-house)
	(believes_at neighbor hannah neighbor-house)
	(intends neighbor (dead hannah))
	(intends neighbor (has-hidden-weapon neighbor))
	(intends neighbor (has-fled-scene neighbor))
	(intends police (has-found-body police))
	(intends police (has-found-weapon police))
	(intends police (has-solved-murder police))
    )
    (:goal
		(and  
			(has-committed-murder neighbor)
			(has-hidden-weapon neighbor)
			(has-fled-scene neighbor)
		)
    )
)

