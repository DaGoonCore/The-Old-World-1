// Clap
/datum/emote/living/carbon/clap/get_sound(mob/living/user)
	return "oworld/sound/emotes/clap[rand(1,2)].ogg"

// Moan
/datum/emote/living/carbon/moan/get_sound(mob/living/user)
	if(ishuman(user))
		if(user.gender != FEMALE)
			return "oworld/sound/emotes/moan_male[rand(1, 7)].ogg"
		else
			return "oworld/sound/emotes/moan_female[rand(1, 8)].ogg"
	else
		return ..()
