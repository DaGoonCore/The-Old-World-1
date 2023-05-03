/turf
	vis_flags = VIS_INHERIT_PLANE
	inspect_icon_state = "floor"
	bullet_bounce_sound = list(
		'oworld/sound/bullet/casing_bounce1.wav',
		'oworld/sound/bullet/casing_bounce2.wav',
		'oworld/sound/bullet/casing_bounce3.wav',
	)
	/// This height is used exclusively for checking if mobs should fall or not!
	var/turf_height = 0
	/// Should this turf get the clingable element?
	var/clingable = FALSE
	/// If we are clingable, this var stores which sound we make when clung to
	var/clinging_sound = 'oworld/sound/effects/clung.wav'
