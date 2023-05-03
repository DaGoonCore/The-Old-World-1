/obj/item/radio/intercom
	icon = 'oworld/icons/obj/machinery/intercom.dmi'
	icon_state = "intercom"
	base_icon_state = "intercom"

/obj/item/radio/intercom/Initialize(mapload, ndir, building)
	. = ..()
	AddElement(/datum/element/wall_mount)
