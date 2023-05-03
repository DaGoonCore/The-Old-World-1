/obj/structure/grille/window
	name = "window grille"
	desc = "A simple, fragile grille that protects windows."
	icon = 'oworld/icons/obj/structures/smooth_structures/tall/grille_window.dmi'
	frill_icon = 'oworld/icons/obj/structures/smooth_structures/tall/grille_window_frill.dmi'
	icon_state = "grille"
	base_icon_state = "grille"
	plane = GAME_PLANE_ABOVE_WINDOW
	layer = WINDOW_GRILLE_LAYER
	upper_frill_plane = FRILL_PLANE_LOW
	upper_frill_layer = WINDOW_GRILLE_FRILL_LAYER
	lower_frill_plane = GAME_PLANE_ABOVE_WINDOW
	lower_frill_layer = ABOVE_WINDOW_GRILLE_LAYER
	frill_uses_icon_state = TRUE
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_GRILLES_WINDOW)
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_GRILLES_WINDOW)
	pixel_y = WINDOW_OFF_FRAME_Y_OFFSET
	window_grille = TRUE
