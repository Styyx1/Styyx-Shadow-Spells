Scriptname Styy_BombAfterTime extends ActiveMagicEffect
{The documentation string.}
Spell  Property Styy_InfectionSpell Auto
; code
Actor Caster
Actor Target
Event OnEffectStart(Actor akTarget, Actor akCaster)
    Caster = akCaster
    Target = akTarget
    if akTarget.GetActorValue("Health") > 1
        RegisterForSingleUpdate(15)
    Endif
    if akTarget.IsDead() == true
        akCaster.DoCombatSpellApply(Styy_InfectionSpell, akTarget)
    else
        RegisterForSingleUpdate(15)
    endif
endevent
Event OnUpdate()
    Caster.DoCombatSpellApply(Styy_InfectionSpell, Target)
Endevent
Event OnDeath(Actor akKiller)
    Caster.DoCombatSpellApply(Styy_InfectionSpell, Target)
Endevent
