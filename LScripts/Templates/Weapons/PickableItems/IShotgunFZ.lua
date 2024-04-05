--============================================================================
function IShotgunFZ:OnPrecache()
    Cache:PrecacheActor("Shotgun.CWeapon")
end
--============================================================================
function IShotgunFZ:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IShotgunFZ:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)    

    local param  = "f"
    if self.Ammo.Shotgun > self.Ammo.IceBullets then param = "s" end
    ENTITY.SetSynchroString(self._Entity,"IShotgunFZ.CItem"..":"..param)            
    
    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IShotgunFZ:Client_OnCreateEntity(entity,param)
--OriOn_Modification=########################################################################
	local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IShotgunFZ")    
    local tex = "HUD/weapons/ikona_freezer"
	local tex2 = "WeaponsIcons/ikona_freezer"
	local color = {0,102,255}
	local pos = -0.7
	if Cfg.SimpleItems then
		size = 0.7
		if not IsDedicatedServer() then	
			MDL.SetAnim(entity,"none")
		end
		pos = 0
	end
    if param == "s" then
        tex = "HUD/weapons/ikona_shell"
		tex2 = "WeaponsIcons/ikona_shell"
		color = {255,102,0}
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
--function IShotgunFZ:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IShotgunFZ:OnTake(player)    
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity,self.Ammo.Shotgun,self.Ammo.IceBullets) 
    end
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
function IShotgunFZ:TakeFX(pe,aShotgun,aIceBullets)
    local player = EntityToObject[pe]    
    local t = Templates["IShotgunFZ.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "Shotgun"
        player.Ammo.Shotgun = player.Ammo.Shotgun + aShotgun
        player.Ammo.IceBullets = player.Ammo.IceBullets + aIceBullets
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end

    t:SndEnt("pickup",pe)    
end
Network:RegisterMethod("IShotgunFZ.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--============================================================================
function IShotgunFZ:Client_OnCreateSimpleItems(entity,param)
--OriOn_Modification=########################################################################
	ENTITY.KillAllChildrenByName(entity,"IShotgunFZ") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IShotgunFZ")    
    local tex = "HUD/weapons/ikona_freezer"
	local tex2 = "WeaponsIcons/ikona_freezer"
	local color = {0,102,255}
    if param == "s" then
        tex = "HUD/weapons/ikona_shell"
		tex2 = "WeaponsIcons/ikona_shell"
		color = {255,102,0}
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
--OriOn_Modification=end=######################################################################
end
--============================================================================
