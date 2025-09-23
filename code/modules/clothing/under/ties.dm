/obj/item/clothing/tie
	name = "tie"
	desc = "A neosilk clip-on tie."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "bluetie"
	equip_slot_flags = NONE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/tie/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/attachment, ATTACHMENT_SLOT_UNIFORM_TIE, 'icons/obj/clothing/ties_overlay.dmi', attach_features_flags = (ATTACH_REMOVABLE|ATTACH_APPLY_ON_MOB), attach_delay = 1.5 SECONDS, detach_delay = 1.5 SECONDS, mob_overlay_icon = 'icons/mob/ties.dmi')

/obj/item/clothing/tie/blue
	name = "blue tie"
	icon_state = "bluetie"

/obj/item/clothing/tie/red
	name = "red tie"
	icon_state = "redtie"

/obj/item/clothing/tie/horrible
	name = "horrible tie"
	desc = "A neosilk clip-on tie. This one is disgusting."
	icon_state = "horribletie"

/obj/item/clothing/tie/stethoscope
	name = "stethoscope"
	desc = "An outdated medical apparatus for listening to the sounds of the human body. It also makes you look like you know what you're doing."
	icon_state = "stethoscope"

/obj/item/clothing/tie/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && isliving(user))
		if(user.a_intent == INTENT_HELP)
			var/body_part = parse_zone(user.zone_selected)
			if(body_part)
				var/sound = "pulse"
				var/sound_strength

				if(M.stat == DEAD || HAS_TRAIT(M, TRAIT_FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					sound_strength = "hear a weak"
					switch(body_part)
						if("chest")
							if(M.oxyloss < 50)
								sound_strength = "hear a healthy"
							sound = "pulse and respiration"
						if("eyes","mouth")
							sound_strength = "cannot hear"
							sound = "anything"
						else
							sound_strength = "hear a weak"

				user.visible_message("[user] places [src] against [M]'s [body_part] and listens attentively.", "You place [src] against [M.p_their()] [body_part]. You [sound_strength] [sound].")
				return
	return ..(M, user)

//Medals
/obj/item/clothing/tie/medal
	name = "bronze medal"
	desc = "A bronze medal."
	icon_state = "bronze"
	/// Name of the person this is awarded to.
	var/recipient_name
	var/recipient_rank
	var/medal_citation

/obj/item/clothing/tie/medal/examine(mob/user)
	. = ..()
	. += "Awarded to: \'[recipient_rank] [recipient_name]\'. The citation reads \'[medal_citation]\'."

/obj/item/clothing/tie/medal/conduct
	name = "distinguished conduct medal"
	desc = "A bronze medal awarded for distinguished conduct. Whilst a great honor, this is the most basic award given by the TGMC"

/obj/item/clothing/tie/medal/bronze_heart
	name = "bronze heart medal"
	desc = "A bronze heart-shaped medal awarded for sacrifice. It is often awarded posthumously or for severe injury in the line of duty."
	icon_state = "bronze_heart"

/obj/item/clothing/tie/medal/silver
	name = "silver medal"
	desc = "A silver medal."
	icon_state = "silver"

/obj/item/clothing/tie/medal/silver/valor
	name = "medal of valor"
	desc = "A silver medal awarded for acts of exceptional valor."

/obj/item/clothing/tie/medal/gold
	name = "gold medal"
	desc = "A prestigious golden medal."
	icon_state = "gold"

/obj/item/clothing/tie/medal/gold/captain
	name = "medal of captaincy"
	desc = "A golden medal awarded exclusively to those promoted to the rank of captain. It signifies the codified responsibilities of a captain to TGMC, and their undisputable authority over their crew."

/obj/item/clothing/tie/medal/gold/heroism
	name = "medal of exceptional heroism"
	desc = "An extremely rare golden medal awarded only by the TGMC. To recieve such a medal is the highest honor and as such, very few exist."

/obj/item/clothing/tie/medal/letter/commendation
	name = "letter of commendation"
	desc = "A letter printed on cardstock often filled with praise for the person it is intended for."
	icon = 'icons/obj/items/paper.dmi'
	icon_state = "commendation"

//Armbands
/obj/item/clothing/tie/armband
	name = "red armband"
	desc = "A fancy red armband!"
	icon_state = "red"

/*
	Holobadges are worn on the belt or neck, and can be used to show that the holder is an authorized
	Security agent - the user details can be imprinted on the badge with a Security-access ID card
*/

/obj/item/clothing/tie/holobadge

	name = "holobadge"
	desc = "This glowing blue badge marks the holder as THE LAW."
	icon_state = "holobadge"
	equip_slot_flags = ITEM_SLOT_BELT
	var/stored_name = null

/obj/item/clothing/tie/holobadge/cord
	icon_state = "holobadge-cord"
	equip_slot_flags = ITEM_SLOT_MASK

/obj/item/clothing/tie/holobadge/attack_self(mob/user as mob)
	if(!stored_name)
		to_chat(user, "Waving around a badge before swiping an ID would be pretty pointless.")
		return
	if(isliving(user))
		user.visible_message(span_warning("[user] displays [user.p_their()] TGMC Internal Security Legal Authorization Badge.\nIt reads: [stored_name], TGMC Security."),span_warning("You display your TGMC Internal Security Legal Authorization Badge.\nIt reads: [stored_name], TGMC Security."))

/obj/item/clothing/tie/holobadge/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(.)
		return

	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/id_card = I

		if(!(ACCESS_MARINE_BRIG in id_card.access))
			to_chat(user, "[src] rejects your insufficient access rights.")
			return

		to_chat(user, "You imprint your ID details onto the badge.")
		stored_name = id_card.registered_name
		name = "holobadge ([stored_name])"
		desc = "This glowing blue badge marks [stored_name] as THE LAW."

/obj/item/clothing/tie/holobadge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message(span_warning("[user] invades [M]'s personal space, thrusting [src] into [M.p_their()] face insistently."), span_warning("You invade [M]'s personal space, thrusting [src] into [M.p_their()] face insistently. You are the law."))

//Watches
/obj/item/clothing/tie/watch
	name = "wrist watch"
	desc = "A classic wrist watch. Shows the current time and makes you look professional."
	icon_state = "watch"

/obj/item/clothing/tie/watch/examine(mob/user)
	. = ..()
	. += "The time is [worldtime2text()]."

/obj/item/clothing/tie/watch/attack_self(mob/user)
	to_chat(user, "The time is [worldtime2text()].")

/obj/item/clothing/tie/watch/gold
	name = "gold watch"
	desc = "An expensive gold wrist watch. A symbol of status and punctuality."
	icon_state = "watch_gold"

/obj/item/clothing/tie/watch/digital
	name = "digital watch"
	desc = "A modern digital watch with multiple functions."
	icon_state = "watch_digital"

//Tactical Commander Watch
/obj/item/clothing/tie/watch/tactical
	name = "tactical command chronometer"
	desc = "An advanced military chronometer designed for field commanders. Features tactical displays, mission timers, and squad coordination systems."
	icon_state = "watch_tactical"
	/// Mission start time for tracking
	var/mission_start_time
	/// Timer for tactical updates
	var/tactical_update_timer
	/// List of tracked objectives with timestamps
	var/list/mission_objectives = list()
	/// Last squad status check time
	var/last_squad_check = 0

/obj/item/clothing/tie/watch/tactical/Initialize(mapload)
	. = ..()
	mission_start_time = world.time
	tactical_update_timer = addtimer(CALLBACK(src, PROC_REF(tactical_update)), 30 SECONDS, TIMER_LOOP)

/obj/item/clothing/tie/watch/tactical/Destroy()
	if(tactical_update_timer)
		deltimer(tactical_update_timer)
	return ..()

/obj/item/clothing/tie/watch/tactical/examine(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	
	var/mob/living/carbon/human/H = user
	if(!is_command_job(H.job))
		. += span_warning("The advanced functions require command authorization.")
		return
	
	. += span_info("<b>TACTICAL DISPLAY:</b>")
	. += "Mission Time: [get_mission_duration()]"
	. += "Squad Status: [get_squad_summary()]"
	if(length(mission_objectives))
		. += "<b>Active Objectives:</b>"
		for(var/obj_text in mission_objectives)
			. += "- [obj_text] ([mission_objectives[obj_text]])"

/obj/item/clothing/tie/watch/tactical/attack_self(mob/user)
	if(!ishuman(user))
		return ..()
	
	var/mob/living/carbon/human/H = user
	if(!is_command_job(H.job))
		to_chat(user, span_warning("ACCESS DENIED: Command authorization required."))
		return
	
	var/list/options = list(
		"Show Time" = "time",
		"Mission Status" = "mission", 
		"Squad Coordinates" = "coords",
		"Casualty Report" = "casualties",
		"Squad Orders" = "orders",
		"Set Objective" = "objective",
		"Tactical Alert" = "alert",
		"Emergency Functions" = "emergency"
	)
	
	var/choice = tgui_input_list(user, "Select tactical function:", "Command Chronometer", options)
	if(!choice)
		return
		
	switch(options[choice])
		if("time")
			show_tactical_time(user)
		if("mission")
			show_mission_status(user)
		if("coords")
			show_squad_coordinates(user)
		if("casualties")
			show_casualty_report(user)
		if("orders")
			show_squad_orders(user)
		if("objective")
			set_mission_objective(user)
		if("alert")
			send_tactical_alert(user)
		if("emergency")
			show_emergency_functions(user)

/// Check if user has command job
/obj/item/clothing/tie/watch/tactical/proc/is_command_job(job_title)
	return job_title in list(FIELD_COMMANDER, CAPTAIN, EXECUTIVE_OFFICER, STAFF_OFFICER)

/// Get mission duration as formatted string
/obj/item/clothing/tie/watch/tactical/proc/get_mission_duration()
	var/duration = world.time - mission_start_time
	var/hours = round(duration / 1 HOURS)
	var/minutes = round((duration % 1 HOURS) / 1 MINUTES)
	return "[hours]:[minutes < 10 ? "0" : ""][minutes]"

/// Get summary of squad status
/obj/item/clothing/tie/watch/tactical/proc/get_squad_summary()
	var/total_marines = 0
	var/active_marines = 0
	
	for(var/datum/squad/squad in SSteams.squads)
		if(!squad)
			continue
		total_marines += length(squad.marines_list)
		for(var/mob/living/carbon/human/marine in squad.marines_list)
			if(marine.stat != DEAD)
				active_marines++
	
	return "[active_marines]/[total_marines] Active"

/// Show detailed tactical time display
/obj/item/clothing/tie/watch/tactical/proc/show_tactical_time(mob/user)
	to_chat(user, span_info("<b>=== TACTICAL CHRONOMETER ===</b>"))
	to_chat(user, span_info("Current Time: [worldtime2text()]"))
	to_chat(user, span_info("Mission Duration: [get_mission_duration()]"))
	to_chat(user, span_info("Squad Status: [get_squad_summary()]"))

/// Show comprehensive mission status
/obj/item/clothing/tie/watch/tactical/proc/show_mission_status(mob/user)
	to_chat(user, span_info("<b>=== MISSION STATUS ===</b>"))
	to_chat(user, span_info("Mission Time: [get_mission_duration()]"))
	to_chat(user, span_info("Marines: [get_squad_summary()]"))
	
	if(length(mission_objectives))
		to_chat(user, span_info("<b>Active Objectives:</b>"))
		for(var/obj_text in mission_objectives)
			to_chat(user, span_info("- [obj_text] (Set: [mission_objectives[obj_text]])"))
	else
		to_chat(user, span_warning("No active objectives set."))

/// Show squad coordinates and positions
/obj/item/clothing/tie/watch/tactical/proc/show_squad_coordinates(mob/user)
	to_chat(user, span_info("<b>=== SQUAD COORDINATES ===</b>"))
	
	for(var/datum/squad/squad in SSteams.squads)
		if(!squad || !length(squad.marines_list))
			continue
			
		to_chat(user, span_info("<b>[squad.name] Squad:</b>"))
		var/squad_count = 0
		for(var/mob/living/carbon/human/marine in squad.marines_list)
			if(marine.stat == DEAD)
				continue
			squad_count++
			if(squad_count > 5) // Limit display to prevent spam
				to_chat(user, span_info("... and [length(squad.marines_list) - 5] more"))
				break
			var/area/marine_area = get_area(marine)
			to_chat(user, span_info("- [marine.name]: [marine_area ? marine_area.name : "Unknown Location"]"))

/// Set a new mission objective
/obj/item/clothing/tie/watch/tactical/proc/set_mission_objective(mob/user)
	var/obj_text = tgui_input_text(user, "Enter mission objective:", "Set Objective", max_length = 100)
	if(!obj_text)
		return
		
	mission_objectives[obj_text] = worldtime2text()
	to_chat(user, span_info("Objective set: [obj_text]"))
	
	// Announce to command channel
	var/mob/living/carbon/human/H = user
	if(H.assigned_squad)
		H.assigned_squad.send_maptext("New objective set by [H.name]: [obj_text]", "Command")

/// Send tactical alert to all squads
/obj/item/clothing/tie/watch/tactical/proc/send_tactical_alert(mob/user)
	var/alert_text = tgui_input_text(user, "Enter tactical alert:", "Tactical Alert", max_length = 150)
	if(!alert_text)
		return
		
	// Send to all marines
	for(var/mob/living/carbon/human/marine in GLOB.human_mob_list)
		if(!marine.assigned_squad)
			continue
		to_chat(marine, span_boldannounce("TACTICAL ALERT: [alert_text]"))
		marine.playsound_local(marine, 'sound/misc/notice2.ogg', 80)
	
	to_chat(user, span_info("Tactical alert sent to all squads."))

/// Periodic tactical updates for the wearer
/obj/item/clothing/tie/watch/tactical/proc/tactical_update()
	var/mob/living/carbon/human/wearer = loc
	if(!ishuman(wearer) || !is_command_job(wearer.job))
		return
	
	// Only update if watch is worn as accessory
	if(wearer.w_uniform?.attachments_by_slot[ATTACHMENT_SLOT_UNIFORM_TIE] != src)
		return
		
	// Check for critical squad status changes
	var/current_time = world.time
	if(current_time - last_squad_check >= 2 MINUTES)
		check_squad_alerts(wearer)
		last_squad_check = current_time

/// Check for squad status that needs commander attention
/obj/item/clothing/tie/watch/tactical/proc/check_squad_alerts(mob/living/carbon/human/commander)
	for(var/datum/squad/squad in SSteams.squads)
		if(!squad)
			continue
			
		var/alive_count = 0
		var/total_count = length(squad.marines_list)
		
		if(total_count == 0)
			continue
			
		for(var/mob/living/carbon/human/marine in squad.marines_list)
			if(marine.stat != DEAD)
				alive_count++
		
		// Alert if squad is critically low
		var/survival_rate = alive_count / total_count
		if(survival_rate <= 0.3 && alive_count > 0) // 30% or less survivors
			to_chat(commander, span_warning("TACTICAL ALERT: [squad.name] Squad critically low - [alive_count]/[total_count] remaining!"))
			commander.playsound_local(commander, 'sound/misc/notice1.ogg', 60)

/// Show detailed casualty report
/obj/item/clothing/tie/watch/tactical/proc/show_casualty_report(mob/user)
	to_chat(user, span_info("<b>=== CASUALTY REPORT ===</b>"))
	
	var/total_deployed = 0
	var/total_casualties = 0
	var/total_mia = 0
	
	for(var/datum/squad/squad in SSteams.squads)
		if(!squad || !length(squad.marines_list))
			continue
			
		var/squad_alive = 0
		var/squad_dead = 0
		var/squad_total = length(squad.marines_list)
		
		for(var/mob/living/carbon/human/marine in squad.marines_list)
			if(marine.stat == DEAD)
				squad_dead++
			else
				squad_alive++
		
		total_deployed += squad_total
		total_casualties += squad_dead
		
		var/status_color = "info"
		if(squad_dead > squad_alive)
			status_color = "danger"
		else if(squad_dead > 0)
			status_color = "warning"
		
		to_chat(user, span_class(status_color, "[squad.name] Squad: [squad_alive] Active, [squad_dead] KIA ([squad_total] total)"))
	
	var/casualty_rate = total_deployed > 0 ? round((total_casualties / total_deployed) * 100, 1) : 0
	to_chat(user, span_info("<b>OVERALL: [total_deployed - total_casualties]/[total_deployed] Active ([casualty_rate]% casualties)</b>"))

/// Show squad orders menu
/obj/item/clothing/tie/watch/tactical/proc/show_squad_orders(mob/user)
	var/list/squad_list = list()
	for(var/datum/squad/squad in SSteams.squads)
		if(squad && length(squad.marines_list))
			squad_list[squad.name] = squad
	
	if(!length(squad_list))
		to_chat(user, span_warning("No active squads found."))
		return
	
	squad_list["ALL SQUADS"] = "all"
	
	var/squad_choice = tgui_input_list(user, "Select squad to command:", "Squad Orders", squad_list)
	if(!squad_choice)
		return
	
	var/list/order_options = list(
		"ADVANCE - Move forward" = "advance",
		"HOLD POSITION - Defend current area" = "hold",
		"RETREAT - Fall back to safe position" = "retreat", 
		"REGROUP - Form up at rally point" = "regroup",
		"MEDICAL - Prioritize wounded" = "medical",
		"CUSTOM ORDER" = "custom"
	)
	
	var/order_choice = tgui_input_list(user, "Select order type:", "Command Order", order_options)
	if(!order_choice)
		return
	
	var/order_text = ""
	switch(order_options[order_choice])
		if("advance")
			order_text = "ADVANCE! Push forward and maintain momentum!"
		if("hold")
			order_text = "HOLD POSITION! Defend your current area at all costs!"
		if("retreat")
			order_text = "TACTICAL RETREAT! Fall back to safer positions immediately!"
		if("regroup")
			order_text = "REGROUP! Form up at the designated rally point!"
		if("medical")
			order_text = "MEDICAL PRIORITY! Secure and evacuate wounded personnel!"
		if("custom")
			order_text = tgui_input_text(user, "Enter custom order:", "Custom Command", max_length = 200)
			if(!order_text)
				return
	
	// Send order to selected squad(s)
	if(squad_list[squad_choice] == "all")
		// Send to all squads
		for(var/datum/squad/squad in SSteams.squads)
			if(!squad || !length(squad.marines_list))
				continue
			send_order_to_squad(squad, order_text, user.name)
		to_chat(user, span_info("Order sent to all active squads: [order_text]"))
	else
		var/datum/squad/target_squad = squad_list[squad_choice]
		send_order_to_squad(target_squad, order_text, user.name)
		to_chat(user, span_info("Order sent to [target_squad.name] Squad: [order_text]"))

/// Send order to specific squad
/obj/item/clothing/tie/watch/tactical/proc/send_order_to_squad(datum/squad/squad, order_text, commander_name)
	if(!squad || !length(squad.marines_list))
		return
	
	for(var/mob/living/carbon/human/marine in squad.marines_list)
		if(marine.stat == DEAD)
			continue
		to_chat(marine, span_boldannounce("FIELD COMMAND ORDER - [commander_name]: [order_text]"))
		marine.playsound_local(marine, 'sound/misc/notice2.ogg', 75)
		
		// Add visual indicator
		marine.overlay_fullscreen("command_order", /atom/movable/screen/fullscreen/flash/blue, 2)
		addtimer(CALLBACK(marine, TYPE_PROC_REF(/mob, clear_fullscreen), "command_order"), 3 SECONDS)

/// Show emergency functions menu
/obj/item/clothing/tie/watch/tactical/proc/show_emergency_functions(mob/user)
	var/list/emergency_options = list(
		"Request Evacuation" = "evac",
		"Emergency Broadcast" = "broadcast", 
		"Mission Abort Signal" = "abort",
		"Medical Emergency Alert" = "medical"
	)
	
	var/choice = tgui_input_list(user, "Select emergency function:", "Emergency Command", emergency_options)
	if(!choice)
		return
		
	switch(emergency_options[choice])
		if("evac")
			request_evacuation(user)
		if("broadcast")
			emergency_broadcast(user)
		if("abort")
			mission_abort_signal(user)
		if("medical")
			medical_emergency_alert(user)

/// Request evacuation through command channels
/obj/item/clothing/tie/watch/tactical/proc/request_evacuation(mob/user)
	var/reason = tgui_input_text(user, "Enter evacuation reason:", "Request Evacuation", max_length = 200)
	if(!reason)
		return
	
	// Add to objectives for tracking
	mission_objectives["EVACUATION REQUESTED: [reason]"] = worldtime2text()
	
	// Broadcast to all command staff and marines
	for(var/mob/living/carbon/human/person in GLOB.human_mob_list)
		if(!person.assigned_squad && !is_command_job(person.job))
			continue
		to_chat(person, span_boldannounce("EVACUATION REQUEST: [reason] - [user.name], Field Commander"))
		person.playsound_local(person, 'sound/misc/notice2.ogg', 90)
	
	to_chat(user, span_info("Evacuation request sent to all personnel."))

/// Send emergency broadcast
/obj/item/clothing/tie/watch/tactical/proc/emergency_broadcast(mob/user)
	var/message = tgui_input_text(user, "Enter emergency broadcast:", "Emergency Broadcast", max_length = 300)
	if(!message)
		return
	
	// Send to everyone on the map
	for(var/mob/living/person in GLOB.alive_mob_list)
		if(ishuman(person))
			to_chat(person, span_boldannounce("EMERGENCY BROADCAST - FIELD COMMAND: [message]"))
			person.playsound_local(person, 'sound/misc/notice2.ogg', 100)
	
	to_chat(user, span_info("Emergency broadcast sent to all personnel."))

/// Signal mission abort
/obj/item/clothing/tie/watch/tactical/proc/mission_abort_signal(mob/user)
	var/confirmation = tgui_alert(user, "Are you sure you want to signal mission abort? This will notify all personnel.", "Mission Abort", list("Confirm", "Cancel"))
	if(confirmation != "Confirm")
		return
	
	mission_objectives["MISSION ABORT SIGNALED"] = worldtime2text()
	
	// Major alert to everyone
	for(var/mob/living/carbon/human/person in GLOB.human_mob_list)
		to_chat(person, span_boldannounce("MISSION ABORT SIGNAL ACTIVATED - ALL UNITS PREPARE FOR IMMEDIATE WITHDRAWAL"))
		person.playsound_local(person, 'sound/misc/notice2.ogg', 100)
	
	to_chat(user, span_danger("Mission abort signal activated."))

/// Send medical emergency alert
/obj/item/clothing/tie/watch/tactical/proc/medical_emergency_alert(mob/user)
	var/location = tgui_input_text(user, "Enter location of medical emergency:", "Medical Emergency", max_length = 100)
	if(!location)
		return
	
	// Send to medical staff and command
	for(var/mob/living/carbon/human/person in GLOB.human_mob_list)
		if(person.job in list("Medical Doctor", "Surgeon", "Researcher", "Chief Medical Officer", FIELD_COMMANDER, CAPTAIN) || person.assigned_squad)
			to_chat(person, span_boldannounce("MEDICAL EMERGENCY ALERT: [location] - Requested by FC [user.name]"))
			person.playsound_local(person, 'sound/misc/notice1.ogg', 85)
	
	to_chat(user, span_info("Medical emergency alert sent."))
