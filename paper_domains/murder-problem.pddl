;;; A problem for demonstrating uncertainty in simple stories
;;; Created by (2022)

(define (problem murder)
    (:domain murder)
    (:objects
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
        ;; Set up location properties explicitly.
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

        ;; Set up neighbor's beliefs about location properties explicitly.
        (believes neighbor (not (at neighbor hannah-house)))
        (believes neighbor (not (at neighbor uncle-house)))
        (believes neighbor (not (at neighbor partner-house)))
        (believes neighbor (not (at neighbor storage-facility)))
        (believes neighbor (not (is-crime-scene hannah-house)))
        (believes neighbor (not (is-crime-scene uncle-house)))
        (believes neighbor (not (is-crime-scene neighbor-house)))
        (believes neighbor (not (is-crime-scene partner-house)))
        (believes neighbor (not (is-crime-scene storage-facility)))
        (believes neighbor (not (is-weapon-location hannah-house)))
        (believes neighbor (not (is-weapon-location uncle-house)))
        (believes neighbor (not (is-weapon-location neighbor-house)))
        (believes neighbor (not (is-weapon-location partner-house)))
        (believes neighbor (not (is-weapon-location storage-facility)))

        ;; Basic truths.
        (at hannah neighbor-house)
        (at neighbor neighbor-house)
        (in knife neighbor-house)

        ;; Murderer specific beliefs.
        (believes neighbor (at neighbor neighbor-house))
        (believes neighbor (in knife neighbor-house))
        (believes neighbor (at hannah neighbor-house))

        ;; Murderer specific intentions: commit the murder, hide the weapon, flee the scene.
        (intends neighbor (dead hannah))
        (intends neighbor (has-hidden-weapon neighbor))
        (intends neighbor (has-fled-scene neighbor))

        ;; Police specific beliefs.
        
        ;; Police specific intentions: find the missing person (body), find the weapon, nab the suspect, solve the murder.
        (intends police (has-found-body police))
        (intends police (has-found-weapon police))
        (intends police (has-solved-murder police))
    )

    ;; Goals: Have the murderer commit the murder, hide the weapon, flee the scene. Police find the body, weapon, suspect,
    ;; and solve the murder.
    (:goal
        (and
            (has-committed-murder neighbor)
            (has-hidden-weapon neighbor)
            (has-fled-scene neighbor)
        )
    )
)