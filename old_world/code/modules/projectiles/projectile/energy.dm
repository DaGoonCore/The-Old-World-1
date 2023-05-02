/obj/item/projectile/energy
	name = "energy"
	icon_state = "spark"
	damage = 0
	damage_type = BURN
	check_armour = "energy"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')


/obj/item/projectile/energy/laser
	damage = 15
	icon_state = "laser"

/obj/item/projectile/energy/laser/powerful
	damage = 40


//releases a burst of light on impact or after travelling a distance
/obj/item/projectile/energy/flash
	name = "chemical shell"
	icon_state = "bullet"
	fire_sound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	damage = 5
	agony = 20
	range =  15 //if the shell hasn't hit anything after travelling this far it just explodes.
	muzzle_type = /obj/effect/projectile/bullet/muzzle
	var/flash_range = 1
	var/brightness = 7
	var/light_colour = "#ffffff"

/obj/item/projectile/energy/flash/on_impact(var/atom/A)
	var/turf/T = flash_range? src.loc : get_turf(A)
	if(!istype(T)) return

	//blind and confuse adjacent people
	for (var/mob/living/carbon/M in viewers(T, flash_range))
		if(M.eyecheck() < FLASH_PROTECTION_MODERATE)
			M.flash_eyes()
			M.eye_blurry += (brightness / 2)
			M.confused += (brightness / 2)

	//snap pop
	playsound(src, 'sound/effects/snap.ogg', 50, 1)
	src.visible_message("<span class='warning'>\The [src] explodes in a bright flash!</span>")

	var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
	sparks.set_up(2, 1, T)
	sparks.start()

	new /obj/effect/decal/cleanable/ash(src.loc) //always use src.loc so that ash doesn't end up inside windows
	new /obj/effect/effect/smoke/illumination(T, 5, brightness, brightness, light_colour)

//blinds people like the flash round, but in a larger area and can also be used for temporary illumination
/obj/item/projectile/energy/flash/flare
	damage = 10
	agony = 25
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
	flash_range = 2
	brightness = 15

/obj/item/projectile/energy/flash/flare/on_impact(var/atom/A)
	light_colour = pick("#e58775", "#ffffff", "#90ff90", "#a09030")

	..() //initial flash

	//residual illumination
	new /obj/effect/effect/smoke/illumination(src.loc, rand(190,240) SECONDS, range=8, power=3, color=light_colour) //same lighting power as flare

/obj/item/projectile/energy/electrode
	name = "electrode"
	icon_state = "tracer"
	fire_sound = 'sound/weapons/guns/fire/pain_fire.ogg'
	mob_hit_sound = list('sound/weapons/tase.ogg')
	nodamage = TRUE
	agony = 50
	damage_type = PAIN
	//Damage will be handled on the MOB side, to prevent window shattering.

/obj/item/projectile/energy/electrode/stunshot
	nodamage = 0
	damage = 15
	agony = 70
	damage_type = BURN
	armor_penetration = 10

/obj/item/projectile/energy/dart
	name = "dart"
	icon_state = "toxin"
	damage = 5
	damage_type = TOX
	weaken = 5


/obj/item/projectile/energy/bolt
	name = "bolt"
	icon_state = "cbbolt"
	damage = 10
	damage_type = TOX
	nodamage = 0
	agony = 40
	stutter = 10


/obj/item/projectile/energy/bolt/large
	name = "largebolt"
	damage = 20
	agony = 60


/obj/item/projectile/energy/neurotoxin
	name = "neuro"
	icon_state = "neurotoxin"
	damage = 5
	damage_type = TOX
	weaken = 30
	stun = 30

/obj/item/projectile/energy/las
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_type = BURN
	sharp = 1
	check_armour = "laser"
	light_power = 4 //Tracers.
	light_range = 2
	light_color = "#D63838"
	penetration_modifier = 1.0
	var/mob_passthrough_check = 0

	muzzle_type = /obj/effect/projectile/muzzle/las

/obj/item/projectile/energy/las/lasgun
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun1.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 48
	armor_penetration = 15

/obj/item/projectile/energy/las/lasgun/overcharge
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 58
	armor_penetration = 25

/obj/item/projectile/energy/las/lasgun/pistol // just use rifle lasgun for over charges for pistol
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun1.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 35

/obj/item/projectile/energy/las/lasgun/lucius
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun1.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 56
	armor_penetration = 15

/obj/item/projectile/energy/las/lasgun/lucius/overcharge
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 65
	armor_penetration = 25

/obj/item/projectile/energy/las/lasgun/longlas
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun1.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 89
	armor_penetration = 35 //more penetration than krieger
	accuracy = 2

/obj/item/projectile/energy/las/lasgun/longlas/overcharge
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 110
	armor_penetration = 45 //more penetration than hotshot

/obj/item/projectile/energy/las/lasgun/hotshot //RYZA PATTERN HOTSHOT LASGUN
	name = "lasbolt"
	fire_sound='sound/weapons/gunshot/lasgun2.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "lasbolt"
	damage = 80 //same damage as krieger but with penetration
	armor_penetration = 45

/obj/item/projectile/energy/pulse/pulserifle
	name = "pulse round"
	fire_sound='sound/weapons/lasgun.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1"
	damage = 51
	armor_penetration = 45 //this is automatic and almost infinite, so, yeah, weak penetration even tho its plasma weaponry

	/obj/item/projectile/energy/pulse/pulsepistol
	name = "pulse round"
	fire_sound='sound/weapons/lasgun.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1"
	damage = 44
	armor_penetration = 25 //this is automatic and almost infinite, so, yeah, weak penetration even tho its plasma weaponry

/obj/item/projectile/energy/pulse/pulserail
	name = "pulse round"
	fire_sound='sound/weapons/lasgun.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1"
	damage = 130
//	agony =  //who did this? this passes through all fucking armor... EVEN IF THEY DIDNT TAKE ANY DAMAGE THEY WOULD HAVE A FUCKLOAD OF PAIN
	armor_penetration = 60

/obj/item/projectile/energy/pulse/ion
	name = "ION round"
	fire_sound='sound/weapons/lasgun.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1"
	damage = 115
	armor_penetration = 65
//	agony = 0
//	stun = 5


/obj/item/projectile/energy/pulse/plasmarifle
	name = "plasma round"
	fire_sound='sound/weapons/marauder.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1_bl"
	damage = 95
	armor_penetration = 60 //HUMAN plasma weaponry are more powerful than TAU weaponry at the cost of having a random change of exploding, but anyway.
	light_power = 4
	light_color = "#2132cf"


/obj/item/projectile/energy/pulse/plasmapistol
	name = "plasma round"
	fire_sound='sound/weapons/marauder.ogg'
	wall_hitsound = 'sound/weapons/guns/misc/laser_searwall.ogg'
	icon_state = "pulse1_bl"
	damage = 70
	armor_penetration = 50
	light_power = 4
	light_color = "#2132cf"

/obj/item/projectile/warpboltcrappy
	name = "Warp Bolt"
	icon_state = "warpboltcrappy"
	damage = 20
	agony = 15 //Its warp magic it hurts more than it really is damaging.
	eyeblur = 10 //the warp magic disrupts your eyes for a moment.
	light_power = 4 //It glows because warp idk.
	damage_type = BURN
	check_armour = "energy"
	light_range = 4
	light_color = "#4A069E"

/obj/item/projectile/energy/thallax/lightning
	name = "lightning"
	icon_state = "stun"
	damage = 75
	armor_penetration = 40
	agony = 35
	damage_type = BURN
	check_armour = "energy"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	range =  15
	var/flash_range = 1
	var/brightness = 7
	var/light_colour = "#ffffff"

/obj/item/projectile/energy/thallax/lightning/on_impact(var/atom/A)
	var/turf/T = flash_range? src.loc : get_turf(A)
	if(!istype(T)) return

	//blind and confuse adjacent people
	for (var/mob/living/carbon/M in viewers(T, flash_range))
		if(M.eyecheck() < FLASH_PROTECTION_MODERATE)
			M.flash_eyes()
			M.eye_blurry += (brightness / 2)
			M.confused += (brightness / 2)

	//snap pop
	playsound(src, 'sound/effects/snap.ogg', 50, 1)
	src.visible_message("<span class='warning'>\The [src] explodes in a bright flash!</span>")
