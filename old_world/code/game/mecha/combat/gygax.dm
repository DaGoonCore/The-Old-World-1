/obj/mecha/combat/gygax
	desc = "A lightweight combat exosuit, utilized by Sororitas Repentia."
	name = "Repentance Machine"
	icon_state = "gygax"
	initial_icon = "gygax"
	step_in = 3
	dir_in = 1 //Facing North.
	health = 500
	deflect_chance = 15
	damage_absorption = list("brute"=0.6,"fire"=1,"bullet"=0.7,"laser"=0.65,"energy"=0.85,"bomb"=0.85)
	max_temperature = 25000
	infra_luminosity = 6
	var/overload = 0
	var/overload_coeff = 2
	wreckage = /obj/effect/decal/mecha_wreckage/gygax
	internal_damage_threshold = 35
	max_equip = 3
	var/overload_disable_message = "You disable leg actuators overload"
	var/overload_enable_message = "You enable leg actuators overload"
/*
/obj/mecha/combat/gygax/dark
	desc = "A lightweight exosuit used by Heavy Asset Protection. A significantly upgraded Gygax security mech."
	name = "Dark Gygax"
	icon_state = "darkgygax"
	initial_icon = "darkgygax"
	health = 500
	deflect_chance = 25
	damage_absorption = list("brute"=0.55,"fire"=0.8,"bullet"=0.55,"laser"=0.4,"energy"=0.65,"bomb"=0.75)
	max_temperature = 45000
	overload_coeff = 1
	wreckage = /obj/effect/decal/mecha_wreckage/gygax/dark
	max_equip = 4
	step_energy_drain = 5

/obj/mecha/combat/gygax/dark/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/flashbang/clusterbang
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/teleporter
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	ME.attach(src)
	return

/obj/mecha/combat/gygax/dark/add_cell()
	cell = new /obj/item/cell/hyper(src)

/obj/mecha/combat/gygax/verb/overload()
	set category = "Exosuit Interface"
	set name = "Toggle leg actuators overload"
	set src = usr.loc
	set popup_menu = 0
	if(usr!=src.occupant)
		return
	if(overload)
		overload = 0
		step_in = initial(step_in)
		step_energy_drain = initial(step_energy_drain)
		src.occupant_message("<font color='blue'>[overload_disable_message]</font>")
	else
		overload = 1
		step_in = min(1, round(step_in/2))
		step_energy_drain = step_energy_drain*overload_coeff
		src.occupant_message("<font color='red'>[overload_enable_message]</font>")
	src.log_message("Toggled leg actuators overload.")
	return

/obj/mecha/combat/gygax/do_move(direction)
	if(!..()) return
	if(overload)
		health--
		if(health < initial(health) - initial(health)/3)
			overload = 0
			step_in = initial(step_in)
			step_energy_drain = initial(step_energy_drain)
			src.occupant_message("<font color='red'>Leg actuators damage threshold exceded. Disabling overload.</font>")
	return


/obj/mecha/combat/gygax/get_stats_part()
	var/output = ..()
	output += "<b>Leg actuators overload: [overload?"on":"off"]</b>"
	return output

/obj/mecha/combat/gygax/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_leg_overload=1'>Toggle leg actuators overload</a>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/gygax/Topic(href, href_list)
	..()
	if (href_list["toggle_leg_overload"])
		src.overload()
	return
*/