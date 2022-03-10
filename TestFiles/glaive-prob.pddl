
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
police-station - place
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
	(at police police-station)
	(not (at police hannah-house))
	(not (at police uncle-house))
	(not (at police neighbor-house))
	(not (at police partner-house))
	(not (at police storage-facility))
	(not (at neighbor hannah-house))
	(not (at neighbor uncle-house))
	(not (at neighbor partner-house))
	(not (at neighbor storage-facility))
	(believes_at neighbor neighbor neighbor-house)
	(believes_in neighbor knife neighbor-house)
	(believes_at neighbor hannah neighbor-house)
	(intends neighbor (dead hannah))
	(intends neighbor (has-hidden-weapon neighbor))
	(intends neighbor (has-fled-scene neighbor))
	(believes_at police police police-station)
	(believes_not_at police police hannah-house)
	(believes_not_at police police uncle-house)
	(believes_not_at police police neighbor-house)
	(believes_not_at police police partner-house)
	(believes_not_at police police storage-facility)
	(intends police (has-found-body police))
	(intends police (has-found-weapon police))
	(intends police (has-solved-murder police))
    )
    (:goal
		(and  
			(has-committed-murder neighbor)
			(has-hidden-weapon neighbor)
			(has-fled-scene neighbor)
			(has-found-body police)
			(has-found-weapon police)
			(has-solved-murder police)
		)
    )
)

