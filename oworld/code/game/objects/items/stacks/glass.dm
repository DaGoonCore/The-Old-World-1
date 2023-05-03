/obj/item/shard

/obj/item/shard/on_entered(datum/source, mob/living/entered)
	if(istype(entered) && !((entered.movement_type & FLYING|FLOATING) || entered.buckled))
		playsound(src, pick('oworld/sound/effects/glass1.wav', 'oworld/sound/effects/glass2.wav'), HAS_TRAIT(entered, TRAIT_LIGHT_STEP) ? 30 : 50, TRUE)
