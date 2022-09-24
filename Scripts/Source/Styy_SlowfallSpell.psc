Scriptname Styy_SlowfallSpell extends ActiveMagicEffect
{The documentation string.}
;Havok ini setting default 1.35 stored in a global ,thanks Enai}
Import Utility

GlobalVariable Property Styy_SlowFallGlobal Auto
GlobalVariable Property Styy_SlowFallBaseSkyrim Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
    Debug.Trace("Default setting is" + GetIniFloat("fInAirFallingCharGravityMult:Havok"))
	utility.SetIniFloat("fInAirFallingCharGravityMult:Havok", Styy_SlowFallGlobal.GetValue())
    Debug.Notification("Gravity lowered")
EndEvent
Event OnEffectFinish(Actor akCaster, Actor akTarget)
    utility.SetIniFloat("fInAirFallingCharGravityMult:Havok", Styy_SlowFallBaseSkyrim.GetValue())
    Debug.Notification("Default Restored")
EndEvent

