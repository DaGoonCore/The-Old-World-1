/obj/machinery/status_display
	icon = 'oworld/icons/obj/machinery/status_display.dmi'

/obj/machinery/status_display/Initialize(mapload, ndir, building)
	. = ..()
	AddElement(/datum/element/wall_mount)
