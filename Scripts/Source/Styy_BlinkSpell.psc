Scriptname Styy_BlinkSpell extends ObjectReference

Actor Property PlayerRef Auto
Perk Property Styy_BlinkPerk Auto 
{Negates fall damage, sets detection light & movement to 0}

Event OnLoad()
	PlayerRef.AddPerk(Styy_BlinkPerk)
    debug.trace("perk added, go nuts")
	Float DistanceToTarget = self.GetDistance(PlayerRef as ObjectReference)
	PlayerRef.TranslateToRef(self as ObjectReference, 10000 as Float, 0.000000)
    debug.trace("player is objectref. Bad thing to say :sadge: ")
	utility.Wait(0.100000 + DistanceToTarget / 10000 as Float)
    debug.trace("waiting has occured. Story of my life")
	PlayerRef.RemovePerk(Styy_BlinkPerk)
    debug.trace("No perk for you lul")
	self.DisableNoWait(false)
	self.Delete()
    debug.trace("starting self destruction in: 3,2,... just kidding. already done.")
EndEvent