/proc/get_typing_indicator(bubble_icon = "default")
	var/image/indicator = image(icon = 'oworld/icons/mob/talk.dmi', icon_state = bubble_icon)
	return indicator

/proc/get_ssd_indicator(bubble_icon = "default")
	var/image/indicator = image(icon = 'oworld/icons/mob/ssd.dmi', icon_state = bubble_icon)
	return indicator
