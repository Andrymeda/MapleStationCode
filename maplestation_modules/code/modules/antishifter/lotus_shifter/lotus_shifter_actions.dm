/datum/action/cooldown/mob_cooldown/lotus_gaze
	name = "Lotus Gaze"
	desc = "Focus your sight onto a target; Carve the mana out of their being."

/datum/action/cooldown/mob_cooldown/lotus_gaze/Activate(atom/target)
	var/mob/caster = usr || owner
	if(!isliving(target))
		if(caster)
			target.balloon_alert(caster, "can't target that!")
		return FALSE
	target.balloon_alert(target, "you're fucked!")
	return TRUE
	