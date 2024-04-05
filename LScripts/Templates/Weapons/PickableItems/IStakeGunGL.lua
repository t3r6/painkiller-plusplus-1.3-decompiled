--============================================================================
function IStakeGunGL:OnPrecache()
    Cache:PrecacheActor("StakeGunGL.CWeapon")
end
--============================================================================
function IStakeGunGL:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IStakeGunGL:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)
    --MDL.CreateShadowMap(self._Entity,64)

    local param  = "r"
    if self.Ammo.Stakes > self.Ammo.Grenades then param = "k" end
    ENTITY.SetSynchroString(self._Entity,"IStakeGunGL.CItem"..":"..param)            
    
    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IStakeGunGL:Client_OnCreateEntity(entity,param)
--OriOn_Modification=########################################################################
    local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IStakeGunGL")    
    local tex = "HUD/weapons/ikona_granat_rakieta"
	local tex2 = "WeaponsIcons/ikona_granat_rakieta"
	local color = {255,0,0}
	local pos = -0.7
	if Cfg.SimpleItems then
		size = 0.7
		if not IsDedicatedServer() then	
			MDL.SetAnim(entity,"none")
		end
		pos = 0
	end
    if param == "k" then
        tex = "HUD/weapons/ikona_kolki"
		tex2 = "WeaponsIcons/ikona_kolki"
		color = {0,255,0}
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
--function IStakeGunGL:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IStakeGunGL:OnTake(player)    
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity, self.Ammo.Stakes, self.Ammo.Grenades) 
    end
    
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
function IStakeGunGL:TakeFX(pe,aStakes,aGrenades)
    local player = EntityToObject[pe]    
    local t = Templates["IStakeGunGL.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "StakeGunGL"
        player.Ammo.Stakes = player.Ammo.Stakes + aStakes 
        player.Ammo.Grenades = player.Ammo.Grenades + aGrenades 
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end

    t:SndEnt("pickup",pe)    
end
Network:RegisterMethod("IStakeGunGL.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--OriOn_Modification=######################################################################
--============================================================================
function IStakeGunGL:Client_OnCreateSimpleItems(entity,param)
	ENTITY.KillAllChildrenByName(entity,"IStakeGunGL") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IStakeGunGL")    
    local tex = "HUD/weapons/ikona_granat_rakieta"
	local tex2 = "WeaponsIcons/ikona_granat_rakieta"
	local color = {255,0,0}
    if param == "k" then
        tex = "HUD/weapons/ikona_kolki"
		tex2 = "WeaponsIcons/ikona_kolki"
		color = {0,255,0}
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
--============================================================================
--OriOn_Modification=end=######################################################################
