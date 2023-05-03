/datum/language/russian
	name = "Russian"
	desc = "The language of the Russian Empire, which are currently good allies of the Great British Empire."
	key = "3"
	default_priority = 98
	icon = 'modular_septic/icons/misc/language.dmi'
	icon_state = "russian"
	space_chance = 50

/**
 * Syllables taken from here
 * https://www.sttmedia.com/syllablefrequency-russian
 */
/datum/language/russian/syllables = list(
	//Two letter syllables
	"ТО", "СТ", "НО", "НА", "КО", "НИ", "НЕ","ЕН", "ПО", "РА", "ЛИ", "ОН", "ЕР", "РО", "ОЛ", "ГО", "АЛ", "ОТ", "ОВ", \
	"ТЬ", "РЕ", "ВО", "ПР", "ТА", "КА", "БЫ", "ЕЛ", "ЕТ", "ОС", "АН", "ЛА", "ОР", "ВЕ", "ДЕ", "ЛЬ", "ЛО", "ТЕ", "АЛ", \
	"АН", "БЫ", "ВЕ", "ВО", "ГО", "ДЕ", "ЕЛ", "ЕН", "ЕР", "ЕТ", "КА", "КО", "ЛА", "ЛИ", "ЛО", "ЛЬ", "НА", "НЕ", "НИ", \
	"НО", "ОВ", "ОЛ", "ОН", "ОР", "ОС", "ОТ", "ПО", "ПР", "РА", "РЕ", "РО", "СТ", "ТА", "ТЕ", "ТО", "ТЬ", \
	//Three letter syllables
	"АТЬ", "БЫЛ", "ВЕР", "ЕГО", "ЕНИ", "ЕНН", "ЕСТ", "КАК", "ЛЬН", "ОВА", "ОГО", "ОЛЬ", "ОРО", "ОСТ", "ОТО", "ПРИ", "ПРО", \
	"СТА", "СТВ", "ТОР", "ЧТО", "ЭТО", "БЫЛ", "ЧТО", "ЕНИ", "ОСТ", "ОЛЬ", "АТЬ", "ЕГО", "СТВ", "ПРО", "ВЕР", "ОГО", "ЭТО", \
	"ПРИ", "СТА", "ТОР", "ЕСТ", "ОТО", "ЕНН", "ОВА", "ЛЬН", "ОРО", "КАК", \
)
