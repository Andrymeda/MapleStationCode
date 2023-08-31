// Moves around aimlessly. When another mob is found, aim a beam at it. No melee.
/datum/ai_controller/basic_controller/lotus_shifter
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic(),
	)

	ai_traits = null
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk/less_walking
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/lotus_shifter_aim,
		/datum/ai_planning_subtree/lotus_shifter_attack,
		)

/datum/ai_planning_subtree/lotus_shifter_aim

// If we have a target, aim at them. If the line of sight with them is lost, interrupt it.
/datum/ai_planning_subtree/lotus_shifter_aim/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	var/mob/living/target = controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(QDELETED(target))
		return
	controller.queue_behavior(/datum/ai_behavior/targeted_mob_ability/and_plan_execute, BB_LOTUS_SHIFTER_LOTUS_GAZE, BB_BASIC_MOB_CURRENT_TARGET)

/datum/ai_planning_subtree/lotus_shifter_attack
	
/datum/ai_planning_subtree/lotus_shifter_attack/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	return
