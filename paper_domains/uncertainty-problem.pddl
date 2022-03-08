;;; A problem for demonstrating uncertainty in simple stories
;;; Created by (2022)

(define (problem potion)
    (:domain uncertainty)
    (:objects
        tom - character
        merchant - character
        tomshouse - place
        merchantshouse - place
        market - place
        potion - thing
    )
    (:init
        ;; Basic truths.
        (in potion merchantshouse)
        (at tom tomshouse)
        (at merchant merchantshouse)
        (has merchant potion)

        ;; Tom's beliefs.
        (believes tom (has merchant potion))
        (believes tom (at merchant market))
        (believes tom (at merchant merchantshouse))
        (believes tom (at tom tomshouse))
        (believes tom (not (at tom market)))
        (believes tom (not (at tom merchantshouse)))
        (believes tom (in potion market))
        (believes tom (in potion merchantshouse))

        ;; Merchant's beliefs.
        (believes merchant (at merchant merchantshouse))
        (believes merchant (has merchant potion))

        ;; Tom's intentions.
        (intends tom (has tom potion))
    )

    (:goal
        (and

            (has tom potion)
        )
    )
)