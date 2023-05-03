/obj/structure/fireaxecabinet
	icon = 'oworld/icons/obj/structures/wallmounts.dmi'
	icon_state = "fireaxe_cabinet"
	base_icon_state = "fireaxe_cabinet"

/obj/structure/fireaxecabinet/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/wall_mount)
