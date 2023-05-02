/*Heldenstadt's turfs
Darkgrass
Grass

*/

//Grasses
/turf/open/floor/darkgrass
	name = "grass patch"
	desc = "You can't tell if this is real grass or just cheap plastic imitation."
	icon = 'old_world/icons/turf/flooring/darkgrass.dmi'
	icon_state = "dgrass0"
	floor_tile = /obj/item/stack/tile/darkgrass
	flags_1 = NONE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	var/ore_type = /obj/item/stack/ore/glass
	var/turfverb = "uproot"
	tiled_dirt = FALSE

/turf/open/floor/darkgrass/setup_broken_states()
	return list("sand")

/turf/open/floor/darkgrass/Initialize(mapload)
	. = ..()
	spawniconchange()

/turf/open/floor/darkgrass/proc/spawniconchange()
	icon_state = "dgrass[rand(0,3)]"

/turf/open/floor/darkgrass/attackby(obj/item/C, mob/user, params)
	if((C.tool_behaviour == TOOL_SHOVEL) && params)
		new ore_type(src, 2)
		user.visible_message(span_notice("[user] digs up [src]."), span_notice("You [turfverb] [src]."))
		playsound(src, 'sound/effects/shovel_dig.ogg', 50, TRUE)
		make_plating()
	if(..())
		return

/turf/open/floor/grass
	name = "grass patch"
	desc = "You can't tell if this is real grass or just cheap plastic imitation."
	icon = 'old_world/icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	floor_tile = /obj/item/stack/tile/grass
	flags_1 = NONE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	var/ore_type = /obj/item/stack/ore/glass
	var/turfverb = "uproot"
	tiled_dirt = FALSE

/turf/open/floor/grass/setup_broken_states()
	return list("sand")

/turf/open/floor/grass/Initialize(mapload)
	. = ..()
	spawniconchange()

/turf/open/floor/grass/proc/spawniconchange()
	icon_state = "dgrass[rand(0,3)]"

/turf/open/floor/grass/attackby(obj/item/C, mob/user, params)
	if((C.tool_behaviour == TOOL_SHOVEL) && params)
		new ore_type(src, 2)
		user.visible_message(span_notice("[user] digs up [src]."), span_notice("You [turfverb] [src]."))
		playsound(src, 'sound/effects/shovel_dig.ogg', 50, TRUE)
		make_plating()
	if(..())
		return
//Wood
/turf/open/floor/wood
	desc = "Stylish dark wood."
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/setup_broken_states()
	return list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")

/turf/open/floor/wood/examine(mob/user)
	. = ..()
	. += span_notice("There's a few <b>screws</b> and a <b>small crack</b> visible.")

/turf/open/floor/wood/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	return pry_tile(I, user) ? TRUE : FALSE

/turf/open/floor/wood/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	if(T.turf_type == type)
		return
	var/obj/item/tool = user.is_holding_item_of_type(/obj/item/screwdriver)
	if(!tool)
		tool = user.is_holding_item_of_type(/obj/item/crowbar)
	if(!tool)
		return
	var/turf/open/floor/plating/P = pry_tile(tool, user, TRUE)
	if(!istype(P))
		return
	P.attackby(T, user, params)

/turf/open/floor/wood/pry_tile(obj/item/C, mob/user, silent = FALSE)
	C.play_tool_sound(src, 80)
	return remove_tile(user, silent, (C.tool_behaviour == TOOL_SCREWDRIVER))

/turf/open/floor/wood/remove_tile(mob/user, silent = FALSE, make_tile = TRUE, force_plating)
	if(broken || burnt)
		broken = FALSE
		burnt = FALSE
		if(user && !silent)
			to_chat(user, span_notice("You remove the broken planks."))
	else
		if(make_tile)
			if(user && !silent)
				to_chat(user, span_notice("You unscrew the planks."))
			spawn_tile()
		else
			if(user && !silent)
				to_chat(user, span_notice("You forcefully pry off the planks, destroying them in the process."))
	return make_plating(force_plating)

/turf/open/floor/wood/cold
	temperature = 255.37

/turf/open/floor/wood/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/wood/tile
	icon_state = "wood_tile"
	floor_tile = /obj/item/stack/tile/wood/tile

/turf/open/floor/wood/tile/setup_broken_states()
	return list("wood_tile-broken", "wood_tile-broken2", "wood_tile-broken3")

/turf/open/floor/wood/parquet
	icon_state = "wood_parquet"
	floor_tile = /obj/item/stack/tile/wood/parquet

/turf/open/floor/wood/parquet/setup_broken_states()
	return list("wood_parquet-broken", "wood_parquet-broken2", "wood_parquet-broken3", "wood_parquet-broken4", "wood_parquet-broken5", "wood_parquet-broken6", "wood_parquet-broken7")

/turf/open/floor/wood/large
	icon_state = "wood_large"
	floor_tile = /obj/item/stack/tile/wood/large

/turf/open/floor/wood/large/setup_broken_states()
	return list("wood_large-broken", "wood_large-broken2", "wood_large-broken3")

/*
var/list/flooring_types

/proc/get_flooring_data(var/flooring_path)
	if(!flooring_types)
		flooring_types = list()
	if(!flooring_types["[flooring_path]"])
		flooring_types["[flooring_path]"] = new flooring_path
	return flooring_types["[flooring_path]"]

// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_broken: damaged overlay.
// if has_damage_range is set, append 0-damage_range for state ie.
//   [icon_base]_broken[has_damage_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.
/*
/decl/flooring
	var/name
	var/desc
	var/icon
	var/icon_base
	var/color

	var/has_base_range
	var/has_damage_range
	var/has_burn_range
	var/damage_temperature
	var/apply_thermal_conductivity
	var/apply_heat_capacity

	var/build_type      // Unbuildable if not set. Must be /obj/item/stack.
	var/build_cost = 1  // Stack units.
	var/build_time = 0  // BYOND ticks.

	var/descriptor = "tiles"
	var/flags
	var/can_paint

/decl/flooring/proc/on_remove()
	return

/decl/flooring/grass
	name = "grass"
	desc = "Do they smoke grass out in space, Bowie? Or do they smoke AstroTurf?"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "grass0"
	has_base_range = 3
	damage_temperature = T0C+80
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = /obj/item/stack/tile/grass

/decl/flooring/asteroid
	name = "coarse sand"
	desc = "Gritty and unpleasant."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_base = "asteroid"
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = null

/decl/flooring/carpet
	name = "brown carpet"
	desc = "Comfy and fancy carpeting."
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_base = "brown"
	build_type = /obj/item/stack/tile/carpet
	damage_temperature = T0C+200
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BURN

/decl/flooring/carpet/blue
	name = "blue carpet"
	icon_base = "blue1"
	build_type = /obj/item/stack/tile/carpetblue

/decl/flooring/carpet/blue2
	name = "pale blue carpet"
	icon_base = "blue2"
	build_type = /obj/item/stack/tile/carpetblue2

/decl/flooring/carpet/purple
	name = "purple carpet"
	icon_base = "purple"
	build_type = /obj/item/stack/tile/carpetpurple

/decl/flooring/carpet/orange
	name = "orange carpet"
	icon_base = "orange"
	build_type = /obj/item/stack/tile/carpetorange

/decl/flooring/carpet/green
	name = "green carpet"
	icon_base = "green"
	build_type = /obj/item/stack/tile/carpetgreen

/decl/flooring/carpet/red
	name = "red carpet"
	icon_base = "red"
	build_type = /obj/item/stack/tile/carpetred

/decl/flooring/linoleum
	name = "linoleum"
	desc = "It's like the 2390's all over again."
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_base = "lino"
	can_paint = 1
	build_type = /obj/item/stack/tile/linoleum
	flags = TURF_REMOVE_SCREWDRIVER

/decl/flooring/tiling
	name = "floor"
	desc = "Scuffed from the passage of countless menials."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "steel"
	color = null
	has_damage_range = 4
	damage_temperature = T0C+1400
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN
	build_type = /obj/item/stack/tile/floor
	can_paint = 1

/decl/flooring/tiling/stone
	icon_base = "stone"

/decl/flooring/tiling/brettonian
	icon_base = "bretcob"

/decl/flooring/tiling/brettonian/corner
	icon_base = "bretcobcorner"

/decl/flooring/tiling/brettonian/side
	icon_base = "bretcobside"


/decl/flooring/tiling/mono
	icon_base = "monotile"

/decl/flooring/tiling/white
	desc = "How sterile."
	icon_base = "white"
	color = null
	build_type = /obj/item/stack/tile/floor_white

/decl/flooring/tiling/white/mono
	icon_base = "monotile"

/decl/flooring/tiling/dark
	desc = "How ominous."
	icon_base = "dark"
	color = null
	build_type = /obj/item/stack/tile/floor_dark

/decl/flooring/tiling/dark/mono
	icon_base = "monotile"

/decl/flooring/tiling/freezer
	desc = "Don't slip."
	icon_base = "freezer"
	color = null
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_freezer

/decl/flooring/wood
	name = "wooden floor"
	desc = "Polished redwood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	build_type = /obj/item/stack/tile/wood
	descriptor = "planks"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_CAN_BURN

/decl/flooring/new_wood
	name = "wooden floor"
	desc = "Polished redwood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "new_wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	build_type = /obj/item/stack/tile/wood
	descriptor = "planks"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_CAN_BURN


/decl/flooring/stone
	name = "stone floor"
	desc = "Rough hewn stone"
	icon = 'icons/turf/flooring/stonefloor.dmi'
	icon_base = "Stone0"
	has_damage_range = 6
	descriptor = "cobble"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE |TURF_ACID_IMMUNE|TURF_HAS_CORNERS|TURF_REMOVE_SHOVEL



/decl/flooring/stone/border
	name = "stone floor"
	desc = "Rough hewn stone"
	icon = 'icons/turf/flooring/stonefloor.dmi'
	icon_base = "Border"
	has_damage_range = 6
	descriptor = "cobble"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE |TURF_ACID_IMMUNE|TURF_HAS_CORNERS|TURF_REMOVE_SHOVEL

/decl/flooring/castle
	name = "castle floor"
	desc = "Cobblestone flooring"
	icon = 'icons/turf/flooring/stonefloor.dmi'
	icon_base = "MAIN"
	has_damage_range = 6
	descriptor = "cobble"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE |TURF_ACID_IMMUNE|TURF_HAS_CORNERS|TURF_REMOVE_SHOVEL


/*
/decl/flooring/stone/one
	icon_base = "extra"

/decl/flooring/stone/two
	icon_base = "extra1"

/decl/flooring/stone/three
	icon_base = "extra2"

/decl/flooring/stone/four
	icon_base = "extra3"

/decl/flooring/stone/five
	icon_base = "extra4"

/decl/flooring/stone/six
	icon_base = "extra5"

/decl/flooring/stone/seven
	icon_base = "extra6"

/decl/flooring/stone/eight
	icon_base = "extra7"
*/
/decl/flooring/reinforced
	name = "reinforced floor"
	desc = "Heavily reinforced with steel plating."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "reinforced"
	flags = TURF_REMOVE_WRENCH | TURF_ACID_IMMUNE
	build_type = /obj/item/stack/material/steel
	build_cost = 1
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000
	can_paint = 1

/decl/flooring/reinforced/circuit
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "bcircuit"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1

/decl/flooring/reinforced/circuit/green
	icon_base = "gcircuit"

/decl/flooring/reinforced/circuit/red
	icon_base = "rcircuit"
	flags = TURF_ACID_IMMUNE
	can_paint = 0

/decl/flooring/reinforced/cult
	name = "engraved floor"
	desc = "Unsettling whispers waver from the surface..."
	icon = 'icons/turf/flooring/cult.dmi'
	icon_base = "cult"
	build_type = null
	has_damage_range = 6
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = null

/decl/flooring/reinforced/cult/on_remove()
	cult.remove_cultiness(CULTINESS_PER_TURF)

/decl/flooring/reinforced/shuttle
	name = "floor"
	icon = 'icons/turf/shuttle.dmi'
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1

/decl/flooring/reinforced/shuttle/blue
	icon_base = "floor"

/decl/flooring/reinforced/shuttle/yellow
	icon_base = "floor2"

/decl/flooring/reinforced/shuttle/white
	icon_base = "floor3"

/decl/flooring/reinforced/shuttle/red
	icon_base = "floor4"

/decl/flooring/reinforced/shuttle/purple
	icon_base = "floor5"

/decl/flooring/reinforced/shuttle/darkred
	icon_base = "floor6"

/decl/flooring/reinforced/shuttle/black
	icon_base = "floor7"

/decl/flooring/diona
	name = "biomass"
	desc = "a mass of small intertwined aliens forming a floor... Creepy."
	icon = 'icons/turf/floors.dmi'
	icon_base = "diona"
	flags = TURF_ACID_IMMUNE | TURF_REMOVE_SHOVEL

/decl/flooring/reinforced/ramp
	name = "foot ramp"
	desc = "An archaic means of locomotion along the Z axis."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "ramptop"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK
	can_paint = 1

/decl/flooring/reinforced/ramp/bottom
	icon_base = "rampbot"

/decl/flooring/diona
	name = "biomass"
	desc = "a mass of small intertwined aliens forming a floor... Creepy."
	icon = 'icons/turf/floors.dmi'
	icon_base = "diona"
	flags = TURF_ACID_IMMUNE | TURF_REMOVE_SHOVEL

/decl/flooring/snow
	name = "snow"
	desc = "Mixed snow"
	icon = 'icons/turf/flooring/stonefloor.dmi'
	icon_base = "MAIN"
	has_damage_range = 6
	descriptor = "snow"
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE |TURF_ACID_IMMUNE|TURF_HAS_CORNERS|TURF_REMOVE_SHOVEL*/