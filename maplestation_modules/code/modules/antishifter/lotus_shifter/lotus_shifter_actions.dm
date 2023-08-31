/datum/action/cooldown/mob_cooldown/lotus_gaze
	name = "Lotus Gaze"
	desc = "Focus your sight onto a target; Carve the mana out of their being."
	cooldown_time = 6 SECONDS
	
/datum/action/cooldown/mob_cooldown/lotus_gaze/Activate(atom/target)
	var/mob/caster = usr || owner
	if(!isliving(target))
		if(caster)
			target.balloon_alert(caster, "can't target that!") //in the case of it being controlled by a player
		return FALSE
	target.balloon_alert(target, "beam connected")
	var/datum/beam/gazebeam = caster.Beam(target,icon_state="b_beam",icon='icons/effects/beam.dmi',time=INFINITY,maxdistance=15)
	StartCooldownSelf()
	ADD_TRAIT(caster, TRAIT_IMMOBILIZED, "Lotus Gaze")
	if(do_after(caster, 4 SECONDS, target, timed_action_flags = IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE, extra_checks = CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(can_see), caster, target, 7)))
		QDEL_NULL(gazebeam)
		var/datum/beam/gazebeam = caster.Beam(target,icon_state="b_beam",icon='icons/effects/beam.dmi',time=0.5 SECONDS,maxdistance=15)
	else
		QDEL_NULL(gazebeam)
	REMOVE_TRAIT(caster, TRAIT_IMMOBILIZED, "Lotus Gaze")
	return TRUE
