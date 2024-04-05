--============================================================================
function IRifleFlameThrower:OnPrecache()
    Cache:PrecacheActor("RifleFlameThrower.CWeapon")
end
--============================================================================
function IRifleFlameThrower:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IRifleFlameThrower:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)

    local param  = "r"
    if self.Ammo.FlameThrower > self.Ammo.Rifle then param = "f" end
    ENTITY.SetSynchroString(self._Entity,"IRifleFlameThrower.CItem"..":"..param)
    
    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IRifleFlameThrower:Client_OnCreateEntity(entity,param)
--OriOn_Modification=########################################################################
    local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IRifleFlameThrower")    
    local tex = "WeaponsIcons/ikona_rifle"
	local tex2 = "WeaponsIcons/ikona_rifleSI"
	local color = {153,153,153}
	local pos = -0.7
	if Cfg.SimpleItems then
		size = 0.7
		if not IsDedicatedServer() then 
			MDL.SetAnim(entity,"none")
		end
		pos = 0
	end
    if param == "f" then
        tex = "WeaponsIcons/ikona_rifle" 
		tex2 = "WeaponsIcons/ikona_rifleSI"	
		color = {153,153,153}
    end
	if ENTITY.IsDrawEnabled(entity) then
		if Cfg.SimpleItems then
			if not IsDedicatedServer() then	
				ENTITY.EnableDraw(entity,false,true)
			end
		end		
		if Cfg.WeaponsIcons == 1 then
		    BILLBOARD.SetupCorona(e,1,0,0,0,0,size,0,0,0,tex,Color:New(255,255,255,0):Compose(),4,true)    
		    ENTITY.SetPosition(e,0,pos,0)
		    ENTITY.RegisterChild(entity,e,true,0) 
		    WORLD.AddEntity(e)
		elseif Cfg.WeaponsIcons == 2 then
			BILLBOARD.SetupCorona(e,1,0,0,0,0,size,0,0,0,tex2,Color:New(color[1],color[2],color[3],0):Compose(),4,true)    
		    ENTITY.SetPosition(e,0,pos,0)
		    ENTITY.RegisterChild(entity,e,true,0) 
		    WORLD.AddEntity(e)
		end	
	end
--OriOn_Modification=end=######################################################################
end
--============================================================================
function IRifleFlameThrower:OnTake(player)     
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity,self.Ammo.Rifle,self.Ammo.FlameThrower)
    end
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
--function IRifleFlameThrower:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IRifleFlameThrower:TakeFX(pe,aRifle,aFlameThrower)
    local player = EntityToObject[pe]    
    local t = Templates["IRifleFlameThrower.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "RifleFlameThrower"            
        player.Ammo.Rifle = player.Ammo.Rifle + aRifle
        player.Ammo.FlameThrower = player.Ammo.FlameThrower + aFlameThrower
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end
    
    t:SndEnt("pickup",pe)
end
Network:RegisterMethod("IRifleFlameThrower.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--============================================================================
--OriOn_Modification=######################################################################
function IRifleFlameThrower:Client_OnCreateSimpleItems(entity,param)
	ENTITY.KillAllChildrenByName(entity,"IRifleFlameThrower") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IRifleFlameThrower")    
    local tex = "WeaponsIcons/ikona_rifle"
	local tex2 = "WeaponsIcons/ikona_rifleSI"
	local color = {153,153,153}
    if param == "f" then
        tex = "WeaponsIcons/ikona_rifle" 
		tex2 = "WeaponsIcons/ikona_rifleSI"	
		color = {153,153,153}
    end
	if Cfg.WeaponsIcons == 1 then
	    BILLBOARD.SetupCorona(e,1,0,0,0,0,0.7,0,0,0,tex,Color:New(255,255,255,0):Compose(),4,true)    
	    ENTITY.SetPosition(e,0,0,0)
	    ENTITY.RegisterChild(entity,e,true,0) 
	    WORLD.AddEntity(e)
	elseif Cfg.WeaponsIcons == 2 then
		BILLBOARD.SetupCorona(e,1,0,0,0,0,0.7,0,0,0,tex2,Color:New(color[1],color[2],color[3],0):Compose(),4,true)    
	    ENTITY.SetPosition(e,0,0,0)
	    ENTITY.RegisterChild(entity,e,true,0) 
	    WORLD.AddEntity(e)
	end	
end
--OriOn_Modification=end=######################################################################
--============================================================================
