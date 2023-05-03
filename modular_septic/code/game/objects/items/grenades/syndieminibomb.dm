/obj/item/grenade/syndieminibomb
	desc = "A CMIA manufactured explosive for destruction and demolition. Comes compacted and expands when the button on the top is pressed."
	name = "CMIA minibomb"
	icon = 'oworld/icons/obj/items/grenade.dmi'
	icon_state = "syndicate"
	base_icon_state = "syndicate"
	inhand_icon_state = "flashbang"
	worn_icon_state = "minibomb"
	pin_sound = 'oworld/sound/weapons/bomb_pin.wav'
	spoon_loud = FALSE
	spoon_sound = null
	pickup_sound = null
	ex_dev = 1
	ex_heavy = 2
	ex_light = 4
	ex_flame = 2
	grenade_flags = GRENADE_BUTTONED|GRENADE_VISIBLE_BUTTON
	det_time = 5 SECONDS
	var/datum/looping_sound/syndieminibomb/soundloop

/obj/item/grenade/syndieminibomb/Initialize(mapload)
	. = ..()
	soundloop = new(src, FALSE)

/obj/item/grenade/syndieminibomb/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/item/grenade/syndieminibomb/arm_grenade(mob/user, delayoverride, msg = TRUE, volume = 60)
	. = ..()
	if(active)
		flick("[base_icon_state]_open", src)
		sleep(1.3)
		icon_state = "[initial(icon_state)]_active"
		annoying_fucking_beeping()

/obj/item/grenade/syndieminibomb/proc/annoying_fucking_beeping()
	if(active)
		soundloop.start()
	else
		soundloop.stop()

/obj/item/grenade/syndieminibomb/disarm()
	. = ..()
	icon_state = "[initial(icon_state)]"
	update_overlays()
	annoying_fucking_beeping()

/obj/item/grenade/frag
	icon = 'oworld/icons/obj/items/grenade.dmi'
	icon_state = "frag"
	base_icon_state = "frag"
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 4
	grenade_flags = GRENADE_PINNED|GRENADE_VISIBLE_PIN|GRENADE_VISIBLE_SPOON
	det_time = 1.5 SECONDS

/obj/item/grenade/frag/impact
	name = "impact grenade"
	desc = "A low yield grenade that is designed to detonate on thrown impact. Will not explode when dropped, or placed."
	icon = 'oworld/icons/obj/items/grenade.dmi'
	icon_state = "impactgrenade"
	base_icon_state = "impactgrenade"
	shrapnel_type = null
	det_time = 3
	ex_heavy = 0
	ex_light = 3
	ex_flame = 2

/obj/item/grenade/syndieminibomb/arm_grenade(mob/user, delayoverride, msg = TRUE, volume = 60)
	. = ..()
	if(active)
		flick("[base_icon_state]_open", src)
		sleep(1.3)
		icon_state = "[initial(icon_state)]_active"
		annoying_fucking_beeping()

/obj/item/grenade/frag/semtex
	name = "semtex grenade"
	desc = "A high-explosive grenade meant for demolition or extreme-room clearing. Comes with a audible beeper."
	icon_state = "combine"
	base_icon_state = "combine"
	det_time = 4 SECONDS
	shrapnel_radius = 6
	ex_heavy = 0
	ex_light = 4
	ex_flame = 4
	var/datum/looping_sound/denominator_nade/soundloop

/obj/item/grenade/frag/semtex/Initialize(mapload)
	. = ..()
	soundloop = new(src, FALSE)

/obj/item/grenade/frag/semtex/Destroy()
	. = ..()
	QDEL_NULL(soundloop)

/obj/item/grenade/frag/semtex/update_overlays()
	. = ..()
	if(grenade_spooned)
		. += "[icon_state]_beeper"

/obj/item/grenade/frag/semtex/spoon_grenade()
	. = ..()
	if(grenade_spooned)
		annoying_fucking_beeping()
		update_appearance(UPDATE_ICON)

/obj/item/grenade/frag/semtex/proc/annoying_fucking_beeping()
	if(active)
		soundloop.start()
	else
		soundloop.stop()

/obj/item/grenade/frag/semtex/disarm()
	. = ..()
	icon_state = "[initial(icon_state)]"
	update_overlays()
	annoying_fucking_beeping()

/obj/item/grenade/frag/pipebomb
	name = "pipebomb"
	desc = "An improvised explosive device."
	icon = 'oworld/icons/obj/items/grenade.dmi'
	icon_state = "ted"
	base_icon_state = "ted"
	pin_sound = 'oworld/sound/effects/flare_start.wav'
	spoon_loud = FALSE
	pickup_sound = null
	grenade_flags = GRENADE_FUSED
	det_time = 2 SECONDS

/obj/item/grenade/frag/pipebomb/disarm()
	. = ..()
	icon_state = "ted"

/obj/item/grenade/frag/pipebomb/trap
	name = "bundle pipebomb"
	desc = "A bundle of improvised explosive devices, long and thin enough to be planted in the most unexpected places for the most unexpecting executive or professor to stumble by."
	icon_state = "ted2"
	base_icon_state = "ted2"
	shrapnel_type = /obj/projectile/bullet/shrapnel/ted
	shrapnel_radius = 5
	ex_heavy = 0
	ex_light = 4
	ex_flame = 5
	pin_sound = null
	spoon_loud = FALSE
	pickup_sound = null
	grenade_flags = GRENADE_UNCONVENTIONAL_TRIGGER
	det_time = 2 SECONDS
