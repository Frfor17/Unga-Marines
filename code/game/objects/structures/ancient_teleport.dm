/obj/structure/ancient_teleport
	name = "\improper The ancient Monolith"
	desc = "A strange-looking column of dark purple, like stone, but like volcanic glass, firmly embedded in the ground. Carelessly hollowed-out symbols are visible on all the planks... Creepy..."

	icon = 'icons/obj/structures/ancient_teleport.dmi'
	icon_state = "ancient_teleport_part"

/obj/structure/ancient_teleport/Initialize(mapload)
	. = ..()

/obj/structure/ancient_teleport_rift
	name = "\improper Tear in reality..."
	desc = "Are you looking into the abyss or is the abyss into you?"

	icon = 'icons/obj/structures/ancient_portal_rift.dmi'
	icon_state = "rift"

/obj/structure/ancient_teleport_rift/Initialize(mapload)
	. = ..()
