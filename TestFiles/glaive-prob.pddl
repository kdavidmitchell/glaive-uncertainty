
(define (problem six-rooms-bompiled)
    (:domain rooms-bompiled)
    (:objects
        :objects
alice - character
letter1 - character
letter2 - character
key - key
star - star
r1 - room
r2 - room
r3 - room
r4 - room
r5 - room
r6 - room

    )
    (:init
        (at letter1 r2)
	(at letter2 r6)
	(at alice r3)
	(in key r4)
	(in star r5)
	(locked r5)
	(unlocked-by r5 key)
	(believes_at alice alice r3)
	(believes_not_locked alice r1)
	(believes_not_locked alice r2)
	(believes_not_locked alice r3)
	(believes_not_locked alice r4)
	(believes_not_locked alice r5)
	(believes_not_locked alice r6)
	(intends alice (has alice star))
	(believes_in letter1 star r5)
	(believes_in letter2 key r4)
	(believes_unlocked-by letter2 r5 key)
	(believes_at letter1 letter1 r2)
	(believes_at letter2 letter2 r6)
    )
    (:goal
		(has alice star)
    )
)

