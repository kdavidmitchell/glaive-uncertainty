;;; A problem for demonstrating uncertainty in simple stories
;;; Created by (2022)

(define (problem potion)
    (:domain uncertainty)
    (:objects
        tom - character
        merchant - character
        toms-house - place
        merchants-house - place
        market - place
        potion - thing
    )
    (:init
        (in potion merchants-house)
        (at tom toms-house)
        (at merchant merchants-house)

        (believes tom (has merchant potion))

        (believes tom (at merchant market))
        (believes tom (at merchant merchants-house))

        (intends tom (has tom potion))
    )

    (:goal
        (and
            (has tom potion)
        )
    )
)