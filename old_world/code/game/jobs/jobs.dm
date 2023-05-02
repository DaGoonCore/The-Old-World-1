var/const/ENG               =(1<<0)
var/const/SEC               =(1<<1)
var/const/MED               =(1<<2)
var/const/SCI               =(1<<3)
var/const/CIV               =(1<<4)
var/const/COM               =(1<<5)
var/const/MSC               =(1<<6)
var/const/SRV               =(1<<7)
var/const/SUP               =(1<<8)
var/const/SPT               =(1<<9)
var/const/EXP               =(1<<10)
var/const/GRD               =(1<<11)
var/const/INQ               =(1<<12)
var/const/PIL               =(1<<13)

GLOBAL_LIST_EMPTY(assistant_occupations)

GLOBAL_LIST_EMPTY(command_positions)

GLOBAL_LIST_EMPTY(engineering_positions)

GLOBAL_LIST_EMPTY(medical_positions)

GLOBAL_LIST_EMPTY(science_positions)

GLOBAL_LIST_EMPTY(civilian_positions)

GLOBAL_LIST_EMPTY(security_positions)

GLOBAL_LIST_INIT(nonhuman_positions, list("pAI"))

GLOBAL_LIST_EMPTY(service_positions)

GLOBAL_LIST_EMPTY(supply_positions)

GLOBAL_LIST_EMPTY(support_positions)

GLOBAL_LIST_EMPTY(exploration_positions)

GLOBAL_LIST_EMPTY(unsorted_positions) // for nano manifest

GLOBAL_LIST_EMPTY(nobles) //For revolution game mode.

GLOBAL_LIST_EMPTY(imperial_guard_positions) //Guard jobs

GLOBAL_LIST_EMPTY(inquisition_positions) //self explanatory

GLOBAL_LIST_EMPTY(pilgrim_positions) //pilgrims to the outpost, non-guard, non RT staff


/proc/guest_jobbans(var/job)
	return ((job in GLOB.command_positions))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	if(!job)
		return
	var/list/jobs = get_job_datums()
	var/list/titles = list()
	var/datum/job/job_datum = jobs[job]
	if(!job)
		return

	for(var/alt_title in job_datum.alt_titles)
		if(alt_title == job)
			continue
		titles += alt_title
	return titles
