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
        ;; Basic truths.
        (not (dead hannah))
        (at hannah neighbor-house)
        (not (at  hannah hannah-house))
        (not (at  hannah uncle-house))
        (not (at  hannah partner-house))
        (not (at  hannah storage-facility))
        (in neighbor-house knife)

        ;; Police's beliefs
        (believes police not(dead hannah))
        (believes police (at  hannah hannah-house))
        (believes police (at  hannah uncle-house))
        (believes police (at  hannah partner-house))
        (believes police (at  hannah storage-facility))
        (believes police (at  hannah neighbor-house))
        (believes police (in  knife hannah-house))
        (believes police (in  knife uncle-house))
        (believes police (in  knife partner-house))
        (believes police (in  knife storage-facility))
        (believes police (in  knife neighbor-house))


        ;; ??? what to put for intention?
        (intends police (has police hannah))
    )

    (:goal
        (and
            (dead hannah)
            (has neighbor knife)
            
        )
    )
)