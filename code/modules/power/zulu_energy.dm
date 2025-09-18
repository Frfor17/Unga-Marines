// zulu fuel cell is key element of energy source of Crusader Heavy Exosuit
// you need to fuel the suit, you can inject it into suit, like injection ordinary fuel cell into generator

/obj/item/zulu_fuel_cell
	name = "\improper The Helg's Battery"
	icon = 'icons/obj/items/fuel_cell.dmi'
	icon_state = "zulu-cell-full"
	desc = "A Zulu energy fuel cell, created and named after its inventor, Helga Grüten Gros, designed to work as a power source for the Crusader Special Heavy exoskeleton or for any other machinery, using basics of Zulu energy."
	/// The amount of fuel currently in the cell
	var/fuel_amount = 0
	/// The maximum amount of fuel the cell holds
	var/max_fuel_amount = 100
