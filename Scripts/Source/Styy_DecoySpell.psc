Scriptname Styy_DecoySpell extends ActiveMagicEffect

Actor Property PlayerRef Auto
Faction Property MagicAllegianceFaction Auto
Spell Property Styy_RageCloakSpell Auto
Outfit Property Styy_DecoyOutfit Auto
Actor Decoy

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Decoy = akCaster.PlaceActorAtMe(PlayerRef.GetBaseObject() as Actorbase, 0, none)
    Decoy.disable(false)
    Decoy.AddToFaction(MagicAllegianceFaction)
    Decoy.SetPlayerTeamMate(true, false)
    Decoy.MoveTo(akTarget as ObjectReference, 0, 0, 0, true)
    Decoy.SetOutfit(Styy_DecoyOutfit)
    Decoy.enable(false)
    Decoy.AddSpell(Styy_RageCloakSpell)
    Styy_RageCloakSpell.cast(Decoy)
    Decoy.SetRestrained()
    Decoy.SetDontMove(true)    
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    if akCaster
        while akCaster.IsInKillmove() || Decoy.IsInKillmove()
        utility.wait(0.1)
        endwhile
    endif
    Decoy.delete()
EndEvent


