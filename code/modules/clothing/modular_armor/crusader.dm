// armor-sprite of Cnaper Dodo for map
/obj/item/clothing/suit/modular/jaeger/crusader
	name = "\improper Crusader Special Heavy exoskeleton"
	desc = "Experimental heavy exoskeleton utilizing reverse-engineered ancient Zulu energy systems. Provides the user with extremely high combat performance. The armor's experimental systems make it impossible to remove without specialized equipment."


	icon = 'icons/mob/modular/crusader_armor.dmi'
	icon_state = "full_body_armor"
	worn_icon_state = "full_body_armor"
	soft_armor = MARINE_ARMOR_HEAVY
	slowdown = SLOWDOWN_ARMOR_HEAVY

	greyscale_config = null

	worn_icon_list = list(slot_wear_suit_str = 'icons/mob/modular/crusader_armor.dmi')

	var/static/list/connections = list(
		COMSIG_FIND_FOOTSTEP_SOUND = TYPE_PROC_REF(/atom/movable, footstep_override),
	)

/obj/item/clothing/suit/modular/jaeger/crusader/footstep_override(atom/movable/source, list/footstep_overrides)
        footstep_overrides[FOOTSTEP_HULL] = 3  // приоритет 3 для звука корпуса

//jaeger hats
// /obj/item/clothing/head/modular/marine/crusader

// 	icon = 'icons/mob/modular/crusader_armor.dmi'
// 	icon_state = "helmet"
// 	worn_icon_state = "helmet"

// 	greyscale_config = null
