/obj/structure/nuke_icbm
	name = "\improper ICBM Nuke"
	desc = "Holy shit..."

	icon = 'icons/obj/structures/icbm/nuke_icbm.dmi'
	icon_state = "nuke_icbm"

/obj/structure/icbm_platform
	name = "\improper ICBM Platform"
	desc = "You can place death here..."

	icon = 'icons/obj/structures/icbm/platform.dmi'
	icon_state = "platform_for_nuke"

/obj/structure/nuke_rocket
	name = "\improper ICBM Nuke"
	desc = "Holy shit..."

	icon = 'icons/obj/structures/icbm/nuke_rocket.dmi'
	icon_state = "rocket"

/obj/structure/nuke_rocket/verb/Activate()
		usr << "You activate the ICBM! (This is just a test verb.)"
