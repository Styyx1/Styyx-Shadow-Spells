Scriptname Styy_ShadowInvisibilitySpell extends ActiveMagicEffect
{The documentation string.}
Import Utility

GlobalVariable Property Styy_ShadowLightLevel Auto
Perk Property Styy_ShadowHidePerk Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
if akCaster.HasPerk(Styy_ShadowHidePerk)
    akCaster.RemovePerk(Styy_ShadowHidePerk)
    Debug.Trace("Perk Removed", 0)
    utility.wait(0.1)
    akCaster.addperk(Styy_ShadowHidePerk)
    Debug.Trace("Perk Added", 0)
else
    akCaster.addperk(Styy_ShadowHidePerk)
Debug.Trace("Perk Added", 0)
endif
EndEvent

Event OnEffectFinish(Actor akCaster, Actor akTarget)
    akCaster.RemovePerk(Styy_ShadowHidePerk)
    Debug.Trace("Perk Removed", 0)
EndEvent




