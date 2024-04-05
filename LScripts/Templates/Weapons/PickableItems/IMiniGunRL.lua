--============================================================================
function IMiniGunRL:OnPrecache()
    Cache:PrecacheActor("MiniGunRL.CWeapon")
end
--============================================================================
function IMiniGunRL:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function IMiniGunRL:OnCreateEntity()
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)

    local param  = "r"
    if self.Ammo.MiniGun > self.Ammo.Grenades then param = "c" end
    ENTITY.SetSynchroString(self._Entity,"IMiniGunRL.CItem"..":"..param)        

    self:Client_OnCreateEntity(self._Entity,param)
end
--============================================================================
function IMiniGunRL:Client_OnCreateEntity(entity,param) 
--OriOn_Modification=########################################################################
	local size = 0.25
	local e = ENTITY.Create(ETypes.Billboard,"Script","IMiniGunRL")    
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
	if param == "c" then
		tex = "HUD/weapons/ikona_chaingun"
		tex2 = "WeaponsIcons/ikona_chaingun"
		color = {255,255,0}
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
function IMiniGunRL:OnTake(player)         
    if Game.GMode == GModes.SingleGame or not (Cfg.WeaponsStay and player.EnabledWeapons[self.SlotIndex]) then 
        self.TakeFX(player._Entity,self.Ammo.MiniGun,self.Ammo.Grenades)        
    end
    if Game.GMode ~= GModes.SingleGame and Cfg.WeaponsStay then return true end
end
--============================================================================
--function IMiniGunRL:OnRespawn()
--    local x,y,z = ENTITY.GetPosition(self._Entity)
--    AddObject("FX_ItemRespawn.CActor",1,Vector:New(x,y,z),nil,true) 
--end
--============================================================================
function IMiniGunRL:TakeFX(pe,aMiniGun,aGrenades)
    local player = EntityToObject[pe]    
    local t = Templates["IMiniGunRL.CItem"]
    if player then        
        player.EnabledWeapons[t.SlotIndex] = "MiniGunRL"            
        player.Ammo.MiniGun = player.Ammo.MiniGun + aMiniGun
        player.Ammo.Grenades = player.Ammo.Grenades + aGrenades
        player:CheckMaxAmmo()
        if player == Player then 
            player:Client_OnTakeWeapon(t.SlotIndex)
            player:PickupFX() 
        end
    end

    t:SndEnt("pickup",pe)    
end
Network:RegisterMethod("IMiniGunRL.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "euu")
--============================================================================
function IMiniGunRL:Client_OnCreateSimpleItems(entity,param)
--OriOn_Modification=########################################################################
	ENTITY.KillAllChildrenByName(entity,"IMiniGunRL") -- Pas frocément utile mais par sécuruté
	local e = ENTITY.Create(ETypes.Billboard,"Script","IMiniGunRL")    
	local tex = "HUD/weapons/ikona_granat_rakieta" 
	local tex2 = "WeaponsIcons/ikona_granat_rakieta"
	local color = {255,0,0}
	if param == "c" then
		tex = "HUD/weapons/ikona_chaingun"
		tex2 = "WeaponsIcons/ikona_chaingun"
		color = {255,255,0}
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
