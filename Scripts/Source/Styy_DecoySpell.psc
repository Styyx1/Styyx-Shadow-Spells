Scriptname Styy_DecoySpell extends ObjectReference
{The documentation string.}

; code

Actor Property PlayerRef Auto
Actor Property Styy_Decoy Auto
Faction Property MagicAllegianceFaction Auto
Spell Property Styy_RageCloak Auto
Actor Decoy

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Decoy = akCaster.PlaceActorAtMe(PlayerRef.GetBaseObject() as Actorbase, 0, none)
    Decoy.disable(false)
    Decoy.AddToFaction(MagicAllegianceFaction)
    Decoy.MoveTo(akTarget as ObjectReference, 0, 0, 0, true)
    Decoy.enable(false)
    Decoy.AddSpell(Styy_RageCloak)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    if akCaster
        while akCaster.IsInKillmove() || Decoy.IsInKillmove()
        utility.wait(0.1)
        endwhile
    endif
    Decoy.delete()
EndEvent


