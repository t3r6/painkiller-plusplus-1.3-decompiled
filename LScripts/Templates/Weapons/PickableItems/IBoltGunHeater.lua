--============================================================================
function IBoltGunHeater:OnPrecache()
    Cache:PrecacheActor("BoltGunHeater.CWeapon")
end
--============================================================================
function IBoltGunHeater:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IBoltGunHeater:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)

    local param  = "h"
    if self.Ammo.Bolt > self.Ammo.HeaterBomb then param = "b" end
    ENTITY.SetSynchroString(self._Entity,"IBoltGunHeater.CItem"..":"..param)
    
    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IBoltGunHeater:Client_OnCreateEntity(entity,param)
--OriOn_Modification=########################################################################
    local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IBoltGunHeater")    
    local tex = "HUD/weapons/ikona_haeterkulki"
	local tex2 = "WeaponsIcons/ikona_haeterkulki" 
	local color = {255,0,153}
	local pos = -0.7
	if Cfg.SimpleItems then
		size = 0.7
		if not IsDedicatedServer() then
			MDL.SetAnim(entity,"none")
		end
		pos = 0
	end
    if param == "b" then        
        tex = "HUD/weapons/ikona_boltymetal"
		tex2 = "WeaponsIcons/ikona_boltymetal"
		color = {0,255,204}
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
function IBoltGunHeater:OnTake(player)     
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity,self.Ammo.Bolt,self.Ammo.HeaterBomb)
    end
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
--function IBoltGunHeater:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IBoltGunHeater:TakeFX(pe,aBolt,aHeaterBomb)
    local player = EntityToObject[pe]    
    local t = Templates["IBoltGunHeater.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "BoltGunHeater"            
        player.Ammo.Bolt = player.Ammo.Bolt + aBolt
        player.Ammo.HeaterBomb = player.Ammo.HeaterBomb + aHeaterBomb
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end
    
    t:SndEnt("pickup",pe)
end
Network:RegisterMethod("IBoltGunHeater.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--============================================================================
--OriOn_Modification=######################################################################
function IBoltGunHeater:Client_OnCreateSimpleItems(entity,param)
	ENTITY.KillAllChildrenByName(entity,"IBoltGunHeater") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IBoltGunHeater")    
    local tex = "HUD/weapons/ikona_haeterkulki"
	local tex2 = "WeaponsIcons/ikona_haeterkulki" 
	local color = {255,0,153}
    if param == "b" then        
        tex = "HUD/weapons/ikona_boltymetal"
		tex2 = "WeaponsIcons/ikona_boltymetal"
		color = {0,255,204}
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
