// Dark Lab


//Base Instance
/area/dark_lab
	name = "Dark Lab"
	icon_state = "ice_colony"
	icon_state = "cliff_blocked"
	ambience = list('sound/ambience/ambi_snow.ogg')

/*
*  ----------------
* | Exterior Areas |
*  ----------------
*/

/area/dark_lab/exterior
	name = "Dark Lab"
	icon_state = "cliff_blocked"
	requires_power = TRUE
	always_unpowered = TRUE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	ambience = list('sound/ambience/ambi_snow.ogg' = 1, 'sound/effects/wind/wind_2_1.ogg' = 1, 'sound/effects/wind/wind_2_2.ogg' = 1, 'sound/effects/wind/wind_3_1.ogg' = 1, 'sound/effects/wind/wind_4_1.ogg' = 1, 'sound/effects/wind/wind_4_2.ogg' = 1, 'sound/effects/wind/wind_5_1.ogg' = 1)
	temperature = ICE_COLONY_TEMPERATURE
	minimap_color = MINIMAP_AREA_COLONY

/*
* Exterior - Surface
*/

//Rough color code for the surface exteriors
//Mountains : Deep Blue/Purple
//Valleys : Light Blue/Cyan
//Open Ground : Gray
//Buildings : Native Color. Command stays Blue, Clinic is Red

/area/dark_lab/exterior/surface
	name = "Dark Lab - Exterior Surface"

//
// Clearing
// The Colony Center, so to speak
//

/area/dark_lab/exterior/surface/clearing
	name = "Dark Lab Clearing"
	icon_state = "clear"

/*
*  -------------------------
* | Built Underground Areas |
*  -------------------------
*/

/area/dark_lab/underground
	name = "Dark Lab - Built Underground"
	icon_state = "explored"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES

//
// Caves
// Extremely simple, anything that is not built is a cave
// For style, we have two subtypes. Open, and dig site
// These do NOT have particular names
//

/area/dark_lab/exterior/underground/caves
	name = "Underground Caves"
	icon_state = "cave"

/area/dark_lab/exterior/underground/caves/open
	icon_state = "explored"

/area/dark_lab/exterior/underground/caves/open/garbledradio
	icon_state = "explored"
	ceiling = CEILING_UNDERGROUND

/*
* Underground - Research
*/

/area/dark_lab/underground/research
	name = "Zeta-V Research Laboratory"
	icon_state = "anolab"
	minimap_color = MINIMAP_AREA_RESEARCH_CAVE

/area/dark_lab/underground/research/storage
	name = "Zeta-V Research Laboratory Storage"
	icon_state = "storage"

/area/dark_lab/underground/research/bluespace_lab
	name = "Zeta-V Research Laboratory Bluespace Lab"
	icon_state = "anosample"

/area/dark_lab/underground/research/energy_lab
	name = "Zeta-V Research Laboratory Energy Lab"
	icon_state = "anosample"

/area/dark_lab/underground/research/reception
	name = "Zeta-V Research Laboratory Reception"
	icon_state = "toxmix"

/area/dark_lab/underground/research/office
	name = "Zeta-V Research Laboratory Office"
	icon_state = "toxmix"

/area/dark_lab/underground/research/server_room
	name = "Zeta-V Research Laboratory Server Room"
	icon_state = "toxmix"
