/datum/event/mortar
	announceWhen = 0
	var/area/area_hit

/datum/event/gravity/mortar
	endWhen = 50
/*
/datum/event/mortar/start()

	area_hit = pick(GLOB.mortar_areas)

	var/mortar_type = pick("gas", "frag", "fire", "arty")
	to_chat(world, uppertext("<font size=5><b>INCOMING!! [area_hit.name]!!</b></font>"))
	for(var/i = 1, i<4, i++)
		sound_to(world, 'sound/effects/arty_distant.ogg')
		sleep(30)

	switch(mortar_type)
		if("frag")
			for(var/i = 1, i<9, i++)//No man's land is a big area so drop a lot of shells.
				var/turf/T = pick(get_area_turfs(area_hit))

				drop_mortar(T, mortar_type)
				sleep(10)

		if("gas")
			for(var/i = 1, i<3, i++)//Only do this three times to reduce lag.
				var/turf/T = pick(get_area_turfs(area_hit))

				drop_mortar(T, mortar_type)
				sleep(10)

		if("fire")
			for(var/i = 1, i<5, i++)//5 fire shells, going hot!
				var/turf/T = pick(get_area_turfs(area_hit))

				drop_mortar(T, mortar_type)
				sleep(10)

		if("arty")
			for(var/i = 1, i<4, i++)//Bosnia and Donbass are very mad for this.
				var/turf/T = pick(get_area_turfs(area_hit))

				drop_mortar(T, mortar_type)
				sleep(10)

				*/