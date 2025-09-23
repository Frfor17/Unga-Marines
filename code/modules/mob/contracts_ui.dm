/datum/contracts_ui
	interaction_flags = INTERACT_MACHINE_TGUI
	var/atom/source_object
	var/tgui_name = "ContractsManager"

/datum/contracts_ui/New(atom/source_object)
	. = ..()
	src.source_object = source_object
	RegisterSignal(source_object, COMSIG_QDELETING, PROC_REF(clean_ui))

///Signal handler to delete the ui when the source object is deleting
/datum/contracts_ui/proc/clean_ui()
	SIGNAL_HANDLER
	qdel(src)

/datum/contracts_ui/Destroy(force)
	source_object = null
	return ..()

/datum/contracts_ui/ui_host()
	return source_object

/datum/contracts_ui/can_interact(mob/user)
	. = ..()
	if(!.)
		return FALSE
	if(!ishuman(user))
		return FALSE
	return TRUE

/datum/contracts_ui/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(ui)
		return
	ui = new(user, src, tgui_name, "Contracts Manager")
	ui.open()

/datum/contracts_ui/ui_static_data(mob/user)
	. = list()
	// Статические данные, которые не изменяются часто

/datum/contracts_ui/ui_data(mob/living/user)
	. = list()
	
	// Получаем список всех контрактов
	.["contracts"] = list()
	for(var/contract_name in GLOB.custom_contracts)
		var/list/contract_data = GLOB.custom_contracts[contract_name]
		if(!contract_data || length(contract_data) < 3)
			continue
			
		var/mob/owner = contract_data[1]
		var/description = contract_data[2]
		var/price = contract_data[3]
		
		// Проверяем, что владелец еще существует
		if(!owner || !owner.real_name)
			continue
			
		.["contracts"] += list(list(
			"name" = contract_name,
			"owner" = owner.real_name,
			"description" = description,
			"price" = price,
			"is_owner" = (owner == user)
		))
	
	// Информация о текущем пользователе
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		.["user_name"] = H.real_name

/datum/contracts_ui/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	
	var/mob/living/carbon/human/user = ui.user
	if(!ishuman(user))
		return FALSE
		
	switch(action)
		if("create_contract")
			var/contract_name = params["name"]
			var/contract_desc = params["description"] 
			var/contract_price = text2num(params["price"])
			
			if(!contract_name || !contract_desc || !contract_price)
				to_chat(user, span_warning("All fields must be filled!"))
				return FALSE
				
			if(contract_price <= 0)
				to_chat(user, span_warning("Price must be greater than 0!"))
				return FALSE
				
			if(contract_name in GLOB.custom_contracts_names)
				to_chat(user, span_warning("A contract with that name already exists!"))
				return FALSE
				
			// Создаем контракт
			user.create_contract_pr(contract_name, contract_desc, contract_price)
			return TRUE
			
		if("delete_contract")
			var/contract_name = params["name"]
			if(!contract_name)
				return FALSE
				
			// Проверяем, что пользователь владелец контракта
			var/list/contract_data = GLOB.custom_contracts[contract_name]
			if(!contract_data || contract_data[1] != user)
				to_chat(user, span_warning("You can only delete your own contracts!"))
				return FALSE
				
			// Удаляем контракт
			GLOB.custom_contracts_names -= contract_name
			GLOB.custom_contracts -= contract_name
			to_chat(user, span_notice("Contract '[contract_name]' has been deleted."))
			return TRUE
	
	return FALSE