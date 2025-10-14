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


//Caves
/area/darklab/caves
	name = "Caves"
	icon_state = "cave"
	ambience = list('sound/ambience/ambimine.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen12.ogg','sound/ambience/ambisin4.ogg')
	ceiling = CEILING_DEEP_UNDERGROUND
	outside = FALSE
	minimap_color = MINIMAP_AREA_CAVES
	always_unpowered = TRUE

/area/darklab/caves/rock
	name = "Enclosed Area"
	icon_state = "transparent"

/area/darklab/caves/northwest
	name = "Northwestern Caves"
	icon_state = "northwest2"
