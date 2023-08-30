
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

/datum/ai_controller/basic_controller/lotus_shifter
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
	)

	ai_traits = null
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		)
