--============================================================================
function ArmorStrong:OnInitTemplate()
    self._Synchronize = self.Synchronize
    self.Synchronize = nil
end
--============================================================================
function ArmorStrong:OnCreateEntity()
    ENTITY.SetSynchroString(self._Entity,"ArmorStrong.CItem") 
    ENTITY.EnableNetworkSynchronization(self._Entity,true,true)
    self._orient = FRand(7.26)
    self:Client_OnCreateEntity(self._Entity)
end
--============================================================================
--OriOn_Modification=########################################################################
function ArmorStrong:Client_OnCreateEntity(entity)
	if Game.GMode ~= GModes.SingleGame then
		if not Cfg.SimpleItems then	
			if Cfg.BrightSkinsArmors then																					
				MDL.SetMeshLighting(entity,"*",false)
				--MATERIAL.Replace("models/mp_armour_gold","FullBrightSkins/mp-model-player7/mpplayer7_texture_brightskin")  
				--local obj = EntityToObject[entity]
				--CONSOLE.AddMessage(self.Light1.." "..light1._Entity.." "..entity,R3D.RGB(0,255,0))
				--MsgBox(obj._Name)
			else
				local light1 = CloneTemplate(self.Light1)
				light1:Apply() 
				ENTITY.RegisterChild(entity,light1._Entity,true)        
				local light2 = CloneTemplate(self.Light2)
				light2:Apply() 
				ENTITY.RegisterChild(entity,light2._Entity,true)
				ENTITY.SetAmbient(entity, true, self.Ambient.R,self.Ambient.G,self.Ambient.B)
			end																											
		else
			if not IsDedicatedServer() then
				MDL.SetAnim(entity,"none")
				if ENTITY.IsDrawEnabled(entity) then	
					ENTITY.EnableDraw(entity,false,true)
					local e = ENTITY.Create(ETypes.Billboard,"Script","ArmorStrong")    
				    local tex = "SIicon/armor_si" --"3Dico/Armor/Gold/Gold_0" 
					BILLBOARD.SetupCorona(e,1,0,0,0,0,0.8,0,0,0,tex,Color:New(self.color[1],self.color[2],self.color[3],0):Compose(),4,true)    
					ENTITY.SetPosition(e,0,-0.45,0)
					ENTITY.RegisterChild(entity,e,true,0) 
					WORLD.AddEntity(e)
				end
			end
		end
	end
end
--OriOn_Modification=end=########################################################################
--============================================================================
function ArmorStrong:OnTake(player) 
    if(MPCfg.ProPlus and self.RescueFactor == 0.33)then
    	self.RescueFactor = 0.5
    end   
    if player.Armor * player.ArmorRescueFactor >= self.ArmorAdd * self.RescueFactor then return true end
    self.TakeFX(player._Entity,self.ArmorType)
    player.ArmorFound = player.ArmorFound + 1
    -- PiTaBOT server mod
    if(Cfg.PitabotEnabled)then
	    local ps = Game.PlayerStats[player.ClientID]
	    PBLogEvent(ps.Name, "TakeArmor", { player.Health, player.Armor, player.ArmorType })
    end
    -- end
end
--============================================================================
function ArmorStrong:TakeFX(pe,atype)
    local player = EntityToObject[pe]    
    
    local t = Templates["ArmorWeak.CItem"]
    if atype == ArmorTypes.Medium then t = Templates["ArmorMedium.CItem"]  end
    if atype == ArmorTypes.Strong then t = Templates["ArmorStrong.CItem"]  end

    if player then        
        player.ArmorType = atype
        player.Armor = t.ArmorAdd
        if(MPCfg.ProPlus and t.RescueFactor == 0.33)then
        	t.RescueFactor = 0.5
        end
        player.ArmorRescueFactor = t.RescueFactor  
        if player == Player then player:PickupFX() end
    end

    t:SndEnt("pickup",pe)
end
Network:RegisterMethod("ArmorStrong.TakeFX", NCallOn.ServerAndAllClients, NMode.Reliable, "eb")
--============================================================================
--function ArmorStrong:Tick(delta)
--    self._orient = self._orient + delta
--    self._orient = math.mod(self._orient, math.pi*2)
--    ENTITY.SetOrientation(self._Entity,self._orient)
--    ENTITY.SetPosition(self._Entity,self.Pos.X,self.Pos.Y+math.sin(self._orient*4)/7,self.Pos.Z)
--end
--============================================================================
function ArmorStrong:Client_OnCreateSimpleItems(entity)
--OriOn_Modification=########################################################################
	local e = ENTITY.Create(ETypes.Billboard,"Script","ArmorStrong")    
    local tex = "SIicon/armor_si"

	BILLBOARD.SetupCorona(e,1,0,0,0,0,0.8,0,0,0,tex,Color:New(self.color[1],self.color[2],self.color[3],0):Compose(),4,true)    
	ENTITY.SetPosition(e,0,-0.45,0)
	ENTITY.RegisterChild(entity,e,true,0) 
	WORLD.AddEntity(e)
--OriOn_Modification=end=######################################################################
end
--============================================================================
