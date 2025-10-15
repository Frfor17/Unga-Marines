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
*  ---------------------
* | Built Surface Areas |
*  ---------------------
*/

/area/dark_lab/surface
	name = "Dark Lab - Built Surface"
	icon_state = "clear"
	ceiling = CEILING_METAL
	outside = FALSE

/*
* Surface - Bar
*/


/area/dark_lab/surface/bar
	name = "Bar"
	icon_state = "bar"
	minimap_color = MINIMAP_AREA_LIVING

/area/dark_lab/surface/bar/bartender_room
	name = "Bartender Room"

/*
* Surface - Garage
*/

/area/dark_lab/surface/garage
	name = "Garage"
	icon_state = "garage"
	minimap_color = MINIMAP_AREA_ENGI

/area/dark_lab/surface/garage/one
	name = "Garage Command Unit"
	icon_state = "garage_one"

/area/dark_lab/surface/garage/two
	name = "Garage Security Unit"
	icon_state = "garage_two"

/*
* Surface - Security
*/

/area/dark_lab/surface/security
	name = "Security Center"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/dark_lab/surface/security/hallway
	name = "Security Center Hallway"
	icon_state = "checkpoint1"

/area/dark_lab/surface/security/armory
	name = "Security Center Armory"
	icon_state = "armory"

/area/dark_lab/surface/security/brig
	name = "Security Center Brig"
	icon_state = "brig"

/area/dark_lab/surface/security/hos_office
	name = "Security Center Hos Office"
	icon_state = "brig"

/area/dark_lab/surface/security/janitor
	name = "Security Center Janitor"
	icon_state = "brig"

/area/dark_lab/surface/security/checkpoint_nuke
	name = "Security Center Nuke Checkpoint"
	icon_state = "brig"

/area/dark_lab/surface/security/reception
	name = "Security Center Reception"
	icon_state = "brig"

/*
* Surface - Port
*/

/area/dark_lab/surface/cargo
	name = "Military cargo port"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_REQ

/area/dark_lab/surface/cargo/waiting_area
	name = "Waiting Area"
	icon_state = "checkpoint1"

/area/dark_lab/surface/cargo/waiting_area_reception
	name = "Waiting Area's reception"
	icon_state = "checkpoint1"

/area/dark_lab/surface/cargo/vip_waiting_area
	name = "VIP's Waiting Area"
	icon_state = "checkpoint1"

/area/dark_lab/surface/cargo/vip_waiting_area_checkpoint
	name = "VIP's Waiting Area Checkpoint"
	icon_state = "checkpoint1"

/area/dark_lab/surface/cargo/office
	name = "Port's office"
	icon_state = "checkpoint1"

/*
* Surface - Colony Administration
*/

/area/dark_lab/surface/command
	name = "Colony Administration"
	icon_state = "bridge"
	minimap_color = MINIMAP_AREA_COMMAND

/area/dark_lab/surface/command/checkpoint_south
	name = "South Colony Administration Security Checkpoint"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/dark_lab/surface/command/security_locker_room_south
	name = "South Colony Administration Security Locker room"
	icon_state = "security"
	minimap_color = MINIMAP_AREA_SEC_CAVE

/area/dark_lab/surface/command/hallway
	name = "Colony Control Center's Hallway"
	icon_state = "maintcentral"

/area/dark_lab/surface/command/control/accounting_office
	name = "Colony Control Accounting Office"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/main_office
	name = "Colony Control Main Office"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/main_office_manager
	name = "Colony Control Office Manager's room"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/briefing_room
	name = "Colony Control Briefing Room"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/head_of_colony_reception
	name = "Head of Colony's reception"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/archive
	name = "Colony's Archive"
	icon_state = "bridge"

/area/dark_lab/surface/command/control/archive_worker_room
	name = "Colony's Archive Worker room"
	icon_state = "bridge"

/area/dark_lab/surface/command/head_of_colony
	name = "Head of Colony"
	icon_state = "head_quarters"


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
