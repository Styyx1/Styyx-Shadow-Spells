Scriptname Styy_PhantomSummonSpell extends ActiveMagicEffect

; Summons multiple hostile Phantoms at the place the target is

Int Property Styy_LevelModifier = 1 Auto
Spell Property Styy_PhantomRageSpellAB Auto
Faction Property MagicAllegianceFaction Auto
ActorBase Property Styy_WolfIllusion Auto
Actor Phantom

Event OnEffectStart(Actor akTarget, Actor akCaster)

    ;akTarget.GetBaseObject() as actorbase
    Phantom = akCaster.PlaceActorAtMe(Styy_WolfIllusion, Styy_LevelModifier, none)
    Phantom.disable(false)
    Phantom.AddToFaction(MagicAllegianceFaction)
    Phantom.SetPlayerTeamMate(true, false)
    Phantom.MoveTo(akTarget as objectreference, 0.000000, 0.000000, 0.000000, true) 
    utility.wait(0.3)
    Phantom.enable(false)
    utility.wait(0.1)
    Phantom.Addspell(Styy_PhantomRageSpellAB)
    if akTarget.isHostileToActor(akCaster)
        Phantom.StartCombat(akTarget)
        akTarget.StartCombat(akCaster)
    endif
EndEvent

Event OnEffectFinish(Actor akCaster, Actor akTarget)
    if akCaster
        while akCaster.IsInKillmove() || Phantom.IsInKillmove()
        utility.wait(0.1)
        endwhile
    endif
    Phantom.delete()
EndEvent

