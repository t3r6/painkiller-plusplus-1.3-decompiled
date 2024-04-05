--============================================================================
function IDriverElectro:OnPrecache()
    Cache:PrecacheActor("DriverElectro.CWeapon")
end
--============================================================================
function IDriverElectro:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IDriverElectro:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)

    local param  = "e"
    if self.Ammo.Shurikens > self.Ammo.Electro then param = "s" end
    ENTITY.SetSynchroString(self._Entity,"IDriverElectro.CItem"..":"..param)
    
    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IDriverElectro:Client_OnCreateEntity(entity,param)
--OriOn_Modification=########################################################################
	local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IDriverElectro")    
    local tex = "HUD/weapons/ikona_electro"
	local tex2 = "WeaponsIcons/ikona_electro"
	local color = {255,255,153}
	local pos = -0.7
	if Cfg.SimpleItems then
		size = 0.7
		if not IsDedicatedServer() then	
			MDL.SetAnim(entity,"none")
		end
		pos = 0
	end
    if param == "s" then
        tex = "HUD/weapons/ikona_szuriken"
		tex2 = "WeaponsIcons/ikona_szuriken"
		color = {204,0,255}
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
function IDriverElectro:OnTake(player)     
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity,self.Ammo.Shurikens,self.Ammo.Electro)
    end
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
--function IDriverElectro:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IDriverElectro:TakeFX(pe,aShurikens,aElectro)
    local player = EntityToObject[pe]    
    local t = Templates["IDriverElectro.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "DriverElectro"            
        player.Ammo.Shurikens = player.Ammo.Shurikens + aShurikens
        player.Ammo.Electro = player.Ammo.Electro + aElectro
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end
    
    t:SndEnt("pickup",pe)
end
Network:RegisterMethod("IDriverElectro.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--============================================================================
--OriOn_Modification=######################################################################
function IDriverElectro:Client_OnCreateSimpleItems(entity,param)
	ENTITY.KillAllChildrenByName(entity,"IDriverElectro") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IDriverElectro")    
    local tex = "HUD/weapons/ikona_electro"
	local tex2 = "WeaponsIcons/ikona_electro"
	local color = {255,255,153}
    if param == "s" then
        tex = "HUD/weapons/ikona_szuriken"
		tex2 = "WeaponsIcons/ikona_szuriken"
		color = {204,0,255}
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
