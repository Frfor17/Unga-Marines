// armor-sprite of Cnaper Dodo for map
/obj/item/clothing/suit/modular/jaeger/crusader
	name = "\improper Crusader Special Heavy exoskeleton"
	desc = "Experimental heavy exoskeleton utilizing reverse-engineered ancient Zulu energy systems. Provides the user with extremely high combat performance. The armor's experimental systems make it impossible to remove without specialized equipment."


	icon = 'icons/mob/modular/crusader_armor.dmi'
	icon_state = "full_body_armor"
	worn_icon_state = "full_body_armor"
	soft_armor = MARINE_ARMOR_HEAVY
	slowdown = SLOWDOWN_ARMOR_HEAVY
	armor_protection_flags = CHEST|GROIN|ARMS|LEGS|FEET|HANDS

	greyscale_config = null

	worn_icon_list = list(slot_wear_suit_str = 'icons/mob/modular/crusader_armor.dmi')

// /obj/item/clothing/suit/modular/jaeger/crusader/equipped(mob/user, slot)
// 	. = ..()
// 	if(slot == slot_wear_suit)
// 		user.AddElement(/datum/element/footstep, FOOTSTEP_CRUSADER)

// /obj/item/clothing/suit/modular/jaeger/crusader/unequipped(mob/user, slot)
//     . = ..()
//     if(slot == slot_wear_suit)
//         // ✅ Возврат обычных шагов
//         var/datum/component/footstep/F = user.GetComponent(/datum/component/footstep)
//         if(F)
//             qdel(F)
