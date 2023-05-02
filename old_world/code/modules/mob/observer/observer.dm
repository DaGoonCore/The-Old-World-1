var/const/GHOST_IMAGE_NONE = 0
var/const/GHOST_IMAGE_DARKNESS = 1
var/const/GHOST_IMAGE_SIGHTLESS = 2
var/const/GHOST_IMAGE_ALL = ~GHOST_IMAGE_NONE

/mob/observer
	density = 0
	alpha = 127
	plane = OBSERVER_PLANE
	invisibility = INVISIBILITY_OBSERVER
	see_invisible = SEE_INVISIBLE_OBSERVER
	sight = SEE_TURFS|SEE_MOBS|SEE_OBJS|SEE_SELF
	simulated = FALSE
	stat = DEAD
	status_flags = GODMODE
	var/ghost_image_flag = GHOST_IMAGE_DARKNESS
	var/image/ghost_image = null //this mobs ghost image, for deleting and stuff

/mob/observer/New()
	..()
	ghost_image = image(src.icon,src)
	ghost_image.plane = plane
	ghost_image.layer = layer
	ghost_image.appearance = src
	ghost_image.appearance_flags = RESET_ALPHA
	if(ghost_image_flag & GHOST_IMAGE_DARKNESS)
		ghost_darkness_images |= ghost_image //so ghosts can see the eye when they disable darkness
	if(ghost_image_flag & GHOST_IMAGE_SIGHTLESS)
		ghost_sightless_images |= ghost_image //so ghosts can see the eye when they disable ghost sight
	updateallghostimages()

/mob/observer/Destroy()
	if (ghost_image)
		ghost_darkness_images -= ghost_image
		ghost_sightless_images -= ghost_image
		qdel(ghost_image)
		ghost_image = null
		updateallghostimages()
	. = ..()

mob/observer/check_airflow_movable()
	return FALSE

/mob/observer/CanPass()
	return TRUE

/mob/observer/dust()	//observers can't be vaporised.
	return

/mob/observer/gib()		//observers can't be gibbed.
	return

/mob/observer/is_blind()	//Not blind either.
	return

/mob/observer/is_deaf() 	//Nor deaf.
	return

/mob/observer/set_stat()
	stat = DEAD // They are also always dead

/proc/updateallghostimages()
	for (var/mob/observer/ghost/O in GLOB.player_list)
		O.updateghostimages()

/mob/observer/touch_map_edge()
	if(z in GLOB.using_map.sealed_levels)
		return

	var/new_x = x
	var/new_y = y

	if(x <= TRANSITIONEDGE)
		new_x = TRANSITIONEDGE + 1
	else if (x >= (world.maxx - TRANSITIONEDGE + 1))
		new_x = world.maxx - TRANSITIONEDGE
	else if (y <= TRANSITIONEDGE)
		new_y = TRANSITIONEDGE + 1
	else if (y >= (world.maxy - TRANSITIONEDGE + 1))
		new_y = world.maxy - TRANSITIONEDGE

	var/turf/T = locate(new_x, new_y, z)
	if(T)
		forceMove(T)
		inertia_dir = 0
		throwing = 0
		to_chat(src, "<span class='notice'>You cannot move further in this direction.</span>")


/mob/observer/Stat()
	. = ..()
	if(statpanel("Status"))
		if(iswarfare())
			if(client?.holder)
				stat("[BLUE_TEAM] reinforcements:", SSwarfare.blue.left)
				//stat("[BLUE_TEAM] capture points:", SSwarfare.blue.points)
				stat("[RED_TEAM] reinforcements:", SSwarfare.red.left)
				//stat("[RED_TEAM] capture points:", SSwarfare.red.points)
/*
			for(var/area/A in GLOB.red_captured_zones)
				stat("Red Captured Trench:", A)
			for(var/area/A in GLOB.blue_captured_zones)
				stat("Blue Captured Trench:", A)
*/
 //this was the first shitty edition, improved in lateparty.dm, there could still be a use for this somewhere, with specific mobs in mind
 /*
/mob/observer/verb/latepartyold()
	set category = "Ghost"
	set name = "Late Party"
	set desc= "Join a randomized late party picked from a list!"

	var/partydelay = 12000 //in deciseconds (20 min rn)

	if(world.time < partydelay) //all this does is cause a delay so people can't suicide or observer and rush the base
		to_chat(src, "It is too early for a late party!")
		return

	var/response = alert(src, "Would you like to try and join the late party?", "Join the Late Party", "Yes", "No")



	if(response == "Yes")
		for(var/mob/living/carbon/human/kroot/M in world) //the mob they will be placed in
			if(M.isempty == 1) //is the mob empty?
				if(M.health > 0)
					to_chat(M,"To be filled later")
					M.key = usr.key
					M.isempty = 0
					break
				to_chat(src,"\blue [M] is dead.")
			else
				to_chat(src,"\blue [M] is occupied.")
				to_chat(src,"\blue They are all occupied!!")
	else if (response == "No")
		to_chat(src,"\blue Then stop bothering me.")

/mob/living/carbon/human/ork/proc/request_player() //this grabs the friend and requests it
	for(var/mob/observer/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can ban shitters
			continue

/mob/living/carbon/human/kroot/proc/request_player() //this grabs the friend and requests it
	for(var/mob/observer/O in GLOB.player_list)
		if(jobban_isbanned(O, "Syndicate")) //so I can ban shitters
			continue
*/