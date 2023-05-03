GLOBAL_LIST_INIT(armor_sounds_damage, \
	list( \
		"heavy" = list( \
			CRUSHING = list('oworld/sound/armor/blunt_heavy1.ogg', 'oworld/sound/armor/blunt_heavy2.ogg', 'oworld/sound/armor/blunt_heavy3.ogg'), \
			PIERCING = list('oworld/sound/bullet/ricochet1.wav', 'oworld/sound/bullet/ricochet2.wav', 'oworld/sound/bullet/ricochet3.wav', 'oworld/sound/bullet/ricochet4.wav'), \
			CUTTING = list('oworld/sound/armor/stab_heavy1.ogg', 'oworld/sound/armor/stab_heavy2.ogg', 'oworld/sound/armor/stab_heavy1.ogg'), \
			IMPALING = list('oworld/sound/armor/chop_heavy1.ogg', 'oworld/sound/armor/chop_heavy2.ogg', 'oworld/sound/armor/chop_heavy1.ogg'), \
			), \
		"light" = list( \
			CRUSHING = list('oworld/sound/armor/light1.ogg', 'oworld/sound/armor/light2.ogg', 'oworld/sound/armor/light3.ogg'), \
			PIERCING = 'oworld/sound/bullet/bullet_light.ogg', \
			CUTTING = list('oworld/sound/armor/light1.ogg', 'oworld/sound/armor/light2.ogg', 'oworld/sound/armor/light3.ogg'), \
			IMPALING = list('oworld/sound/armor/light1.ogg', 'oworld/sound/armor/light2.ogg', 'oworld/sound/armor/light3.ogg'), \
			), \
		"heavy_helmet" = list( \
			CRUSHING = list('oworld/sound/armor/blunt_heavy1.ogg', 'oworld/sound/armor/blunt_heavy2.ogg', 'oworld/sound/armor/blunt_heavy3.ogg'), \
			PIERCING = list('oworld/sound/bullet/ricochet1.wav', 'oworld/sound/bullet/ricochet2.wav', 'oworld/sound/bullet/ricochet3.wav', 'oworld/sound/bullet/ricochet4.wav'), \
			CUTTING = list('oworld/sound/armor/stab_heavy1.ogg', 'oworld/sound/armor/stab_heavy2.ogg', 'oworld/sound/armor/stab_heavy1.ogg'), \
			IMPALING = list('oworld/sound/armor/chop_heavy1.ogg', 'oworld/sound/armor/chop_heavy2.ogg', 'oworld/sound/armor/chop_heavy1.ogg'), \
			), \
		) \
	)
GLOBAL_LIST_INIT(armor_sounds_damage_local, \
	list( \
		"heavy_helmet" = list( \
			CRUSHING = 'oworld/sound/armor/helmet_rape.wav', \
			PIERCING = 'oworld/sound/armor/helmet_rape.wav', \
			CUTTING = 'oworld/sound/armor/helmet_rape.wav', \
			IMPALING = 'oworld/sound/armor/helmet_rape.wav', \
			), \
		) \
	)
GLOBAL_LIST_INIT(armor_sounds_break, \
	list( \
		"heavy" = 'oworld/sound/armor/break_heavy1.wav', \
		"light" = list('oworld/sound/armor/break_light1.wav', 'oworld/sound/armor/break_light2.wav'), \
		"heavy_helmet" = 'oworld/sound/armor/break_heavy1.wav', \
		) \
	)
GLOBAL_LIST_INIT(armor_sounds_break_local, list() )
