GLOBAL_LIST_EMPTY(sprite_accessories)
GLOBAL_LIST_EMPTY(generic_accessories)
GLOBAL_LIST_EMPTY(genetic_accessories)

GLOBAL_LIST_EMPTY(body_markings)
GLOBAL_LIST_EMPTY_TYPED(body_markings_per_limb, /list)
GLOBAL_LIST_EMPTY(body_marking_sets)

GLOBAL_LIST_EMPTY(augment_item_datums)
GLOBAL_LIST_EMPTY_TYPED(augment_slot_to_items, /list)
GLOBAL_LIST_EMPTY_TYPED(augment_categories_to_slots_to_items, /list)

GLOBAL_LIST_INIT(marking_zones, MARKING_BODYPARTS)

GLOBAL_LIST_INIT(robotic_styles_list, list(
	"None" = "None",
	"Surplus" = 'oworld/icons/mob/human/augments/surplus_augments.dmi',
	"Cyborg" = 'oworld/icons/mob/human/augments/augments.dmi',
	"Engineering" = 'oworld/icons/mob/human/augments/augments_engineer.dmi',
	"Mining" = 'oworld/icons/mob/human/augments/augments_mining.dmi',
	"Security" = 'oworld/icons/mob/human/augments/augments_security.dmi',
	"Morpheus Cyberkinetics" = 'oworld/icons/mob/human/augments/mcgipc.dmi',
	"Bishop Cyberkinetics" = 'oworld/icons/mob/human/augments/bshipc.dmi',
	"Bishop Cyberkinetics 2.0" = 'oworld/icons/mob/human/augments/bs2ipc.dmi',
	"Hephaestus Industries" = 'oworld/icons/mob/human/augments/hsiipc.dmi',
	"Hephaestus Industries 2.0" = 'oworld/icons/mob/human/augments/hi2ipc.dmi',
	"Shellguard Munitions Standard Series" = 'oworld/icons/mob/human/augments/sgmipc.dmi',
	"Ward-Takahashi Manufacturing" = 'oworld/icons/mob/human/augments/wtmipc.dmi',
	"Xion Manufacturing Group" = 'oworld/icons/mob/human/augments/xmgipc.dmi',
	"Xion Manufacturing Group 2.0" = 'oworld/icons/mob/human/augments/xm2ipc.dmi',
	"Zeng-Hu Pharmaceuticals" = 'oworld/icons/mob/human/augments/zhpipc.dmi'
))

GLOBAL_LIST_EMPTY(culture_birthsigns)

GLOBAL_LIST_EMPTY(customizable_races)

GLOBAL_LIST_INIT(food_tastes, list(
		"Meat" = MEAT,
		"Vegetables" = VEGETABLES,
		"Raw" = RAW,
		"Junk Food" = JUNKFOOD,
		"Grain" = GRAIN,
		"Fruit" = FRUIT,
		"Dairy" = DAIRY,
		"Fried" = FRIED,
		"Alcohol" = ALCOHOL,
		"Sugar" = SUGAR,
		"Gross" = GROSS,
		"Toxic" = TOXIC,
		"Pineapple" = PINEAPPLE,
		"Breakfast" = BREAKFAST,
		"Cloth" = CLOTH,
		"Nuts" = NUTS,
		"Sewage" = SEWAGE,
	))
