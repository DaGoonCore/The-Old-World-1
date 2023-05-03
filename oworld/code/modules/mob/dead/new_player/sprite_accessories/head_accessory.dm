/datum/sprite_accessory/head_accessory
	icon = 'oworld/icons/mob/human/sprite_accessory/head_accessory.dmi'
	key = "head_acc"
	generic = "Head Accessory"
	relevant_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE

/datum/sprite_accessory/head_accessory/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/BP)
	. = ..()
	if(body_zone && !BP?.advanced_rendering)
		return TRUE
	if((H.head && (H.head.flags_inv & HIDEHAIR)) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEHAIR)))
		return TRUE

/datum/sprite_accessory/head_accessory/none
	name = "None"
	icon_state = "none"
	color_src = null
	factual = FALSE

/datum/sprite_accessory/head_accessory/sylveon_bow
	name = "Sylveon Head Bow"
	icon_state = "sylveon_bow"
	recommended_species = list(SPECIES_SYNTHMAMMAL, SPECIES_MAMMAL, SPECIES_WEREWOLF, SPECIES_WERECAT, SPECIES_HUMAN, SPECIES_SYNTHHUMAN, SPECIES_FELINE, SPECIES_HUMANOID)
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	color_src = USE_MATRIXED_COLORS