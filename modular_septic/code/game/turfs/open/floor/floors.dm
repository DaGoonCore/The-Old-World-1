/turf/open/floor/plating
	icon = 'oworld/icons/turf/floors.dmi'

/turf/open/floor/iron
	icon = 'oworld/icons/turf/floors.dmi'

/turf/open/floor/wood/get_projectile_hitsound(obj/projectile/projectile)
	return "oworld/sound/bullet/projectile_impact/ric_wood[rand(1,5)].wav"

/turf/open/floor/mineral/plastitanium
	icon = 'oworld/icons/turf/floors.dmi'

/turf/open/floor/light/red
	icon_state = "light_on-2"
	currentcolor = COLOR_SOFT_RED

/turf/open/floor/wood
	icon_state = "newwood"
	icon = 'oworld/icons/turf/floors.dmi'

/turf/open/floor/wood/setup_broken_states()
	return list("newwood-broken", "newwood-broken2")
