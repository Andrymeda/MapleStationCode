// One of the more common Anti Shifters, and one of the less dangerous. Stays on areas with leylines that are stronger than the average.
/mob/living/basic/antishifter/lotus_shifter
	name = "Lotus Shifter"
	desc = "A floating creature, shaped like a lotus flower with an eye on top."
	icon = 'maplestation_modules/icons/mob/basic/antishifter_monsters.dmi'
	icon_state = "lotus_shifter"
	icon_living = "lotus_shifter"
	icon_dead = "lotus_shifter_dead"
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC | MOB_PLANT
	movement_type = FLYING
	health = 80
	maxHealth = 80
	speak_emote = list("resonates")
	response_help_continuous = "pats"
	response_help_simple = "pat"
	// butcher_results = if we manage to fit antishifters in well enough, i was thinking about adding 'shifting mass' as some sort of material. 
	// probably used for magic bs, as they are beings made of overabundance of magic and survive on such.

	ai_controller = /datum/ai_controller/basic_controller/lotus_shifter

/mob/living/basic/antishifter/lotus_shifter/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_DEAF, INNATE_TRAIT) //no ears, and even if it had, it's intelligence is low, it cannot out make any words, even common

	// give it it's only ability
	var/datum/action/cooldown/mob_cooldown/lotus_gaze/lotus_gaze = new(src)
	lotus_gaze.Grant(src)
	ai_controller.set_blackboard_key(BB_LOTUS_SHIFTER_LOTUS_GAZE, lotus_gaze)
