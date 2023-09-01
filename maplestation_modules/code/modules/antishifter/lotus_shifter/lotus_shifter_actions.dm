/datum/action/cooldown/mob_cooldown/lotus_gaze
	name = "Lotus Gaze"
	desc = "Focus your sight onto a target; Carve the mana out of their being."
	cooldown_time = 3 SECONDS
	
	
/datum/action/cooldown/mob_cooldown/lotus_gaze/Activate(atom/target)
	var/mob/caster = usr || owner
	if(!isliving(target))
		if(caster)
			target.balloon_alert(caster, "can't target that!") //in the case of it being controlled by a player
		return FALSE
	var/mob/living/gazetarget = target //i gotta turn it into a living in order to even deal damage w it
	
	var/datum/beam/gazebeam = caster.Beam(gazetarget,icon_state="b_beam",icon='icons/effects/beam.dmi',time=INFINITY,maxdistance=15)
	
	ADD_TRAIT(caster, TRAIT_IMMOBILIZED, "Lotus Gaze")
	playsound(owner, 'sound/magic/cosmic_expansion.ogg', 100, TRUE)
	if(do_after(caster, 4 SECONDS, gazetarget, timed_action_flags = IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE, extra_checks = CALLBACK(src, PROC_REF(see_check), caster, target)))
		QDEL_NULL(gazebeam)
		playsound(owner, 'sound/weapons/resonator_blast.ogg', 100, TRUE)
		gazebeam = caster.Beam(gazetarget,icon_state="kinesis",icon='icons/effects/beam.dmi',time=0.5 SECONDS,maxdistance=15)
		gazetarget.apply_damage(15, BURN)
		StartCooldownSelf()
	else
		QDEL_NULL(gazebeam)
		StartCooldownSelf()
	
	REMOVE_TRAIT(caster, TRAIT_IMMOBILIZED, "Lotus Gaze")

/datum/action/cooldown/mob_cooldown/lotus_gaze/proc/see_check(mob/source,mob/target)
	source.face_atom(target)
	return can_see(source, target, 7)

// BUG: apparently they can target u thru walls. oops
