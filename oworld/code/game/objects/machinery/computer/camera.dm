/obj/machinery/computer/security/telescreen
	icon = 'oworld/icons/obj/machinery/telescreen.dmi'
	icon_state = "telescreen"
	base_icon_state = "telescreen"

/obj/machinery/computer/security/telescreen/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/wall_mount)
	update_appearance()
