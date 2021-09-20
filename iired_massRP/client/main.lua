-- debut menu
Citizen.CreateThread(function()
    WarMenu.CreateMenu('iiredmenu', "MassRP")
    WarMenu.SetSubTitle('iiredmenu', 'Select Menu')
    WarMenu.CreateSubMenu('MenuMale', 'iiredmenu', 'Sheriff 1')
    WarMenu.CreateSubMenu('MenuRemoveSkin', 'iiredmenu', 'Sheriff 2')

    while true do

		local playerPed = PlayerPedId()

        if WarMenu.IsMenuOpened('iiredmenu') then
			
			if WarMenu.MenuButton('Sheriff 1', 'MenuMale') then 
            end
			
			
			if WarMenu.MenuButton('Sheriff 2', 'MenuRemoveSkin') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('MenuMale') then

			if WarMenu.Button("Sheriff Jack") then
					TriggerEvent("loadguard")
				WarMenu.CloseMenu()

			elseif WarMenu.Button("Sheriff JOE") then
					TriggerEvent("loadguard1")
				WarMenu.CloseMenu()

			end


            WarMenu.Display()
		
        elseif WarMenu.IsMenuOpened('MenuRemoveSkin') then
			
            if WarMenu.Button("Free") then
            -- ExecuteCommand('rc')
				TriggerEvent("loadguard2")
            WarMenu.CloseMenu()
			elseif WarMenu.Button("Sheriff ttt") then
				TriggerEvent("loadguard3")
            end
            WarMenu.Display()
		
		end
        Citizen.Wait(0)
    end
end)

-- Fin menu
RegisterNetEvent('lto_iiredmenu:open')
AddEventHandler('lto_iiredmenu:open', function(cb)
	WarMenu.OpenMenu('iiredmenu')
end)

 -- ped Config
 RegisterNetEvent('loadguard')
 AddEventHandler('loadguard', function(kek) 
	TriggerEvent("jack", true)
 end)
 RegisterNetEvent('loadguard1')
 AddEventHandler('loadguard1', function(kek) 
	TriggerEvent("joe", true)
 end)

 RegisterNetEvent('loadguard2')
 AddEventHandler('loadguard2', function(kek) 
	TriggerEvent("freeman", true)
 end)
 RegisterNetEvent('loadguard3')
 AddEventHandler('loadguard3', function(kek) 
	TriggerEvent("larry", true)
 end)
 
 
 local function PerformRequest(hash)
	 print("requesting model " .. hash)
 
	 RequestModel(hash, 0) -- RequestModel
 
	 local times = 1
 
	 print("requested " .. times .. " times")
 
	 while not Citizen.InvokeNative(0x1283B8B89DD5D1B6, hash) do -- HasModelLoaded
		 Citizen.InvokeNative(0xFA28FE3A6246FC30, hash, 0) -- RequestModel
 
		 times = times + 1
 
		 print("requested " .. times .. " times")
 
		 Citizen.Wait(0)
		 
		 if times >= 100 then break end
	 end
 end
		 
 function lePlayerModel(name)
	 local model = GetHashKey(name)
	 local player = PlayerId()
	 
	 if not IsModelValid(model) then return end
	 PerformRequest(model)
	 
	 if HasModelLoaded(model) then
		 -- SetPlayerModel(player, model, false)
		 Citizen.InvokeNative(0xED40380076A31506, player, model, false)
		 Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
		 SetModelAsNoLongerNeeded(model)
	 end
 end
 

 
 RegisterNetEvent('jack')
 AddEventHandler('jack', function(source, args) 
	AddRelationshipGroup('ped')
	AddRelationshipGroup('PlayerPed')
	local playerPed = PlayerPedId()

					model = GetHashKey("CS_SheriffOwens")
					RequestModel(model)
					if not HasModelLoaded(model) then 
						RequestModel(model) 
					end
					while not HasModelLoaded(model) do 
						Citizen.Wait(1) 
					end
					local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 0))

					creePed = CreatePed(model, x+2, y+2 , z+2, 0, true, false, 0, 0)
					SetPedRelationshipGroupHash(creePed, 'ped')
					Citizen.InvokeNative(0x283978A15512B2FE, creePed, true)      
					Citizen.InvokeNative(0x23f74c2fda6e7c61, -700928964, creePed) --blips
					GiveWeaponToPed_2(creePed, 0xA84762EC, 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0) -- weapons
               		SetCurrentPedWeapon(creePed, 0xA84762EC, true)-- weapons
					SetEntityCanBeDamagedByRelationshipGroup(creePed, false, 'ped') 
					-- SetPedCombatMovement(creePed,3)
					-- TaskWanderStandard(creePed, 1, 1)
					SetPedAsGroupMember(creePed, GetPedGroupIndex(PlayerPedId()))
		 
					-- SetModelAsNoLongerNeeded(model)
		
		
 end)
 RegisterNetEvent('joe')
 AddEventHandler('joe', function(source, args) 
	AddRelationshipGroup('ped')
	AddRelationshipGroup('PlayerPed')
	local playerPed = PlayerPedId()

					model = GetHashKey("S_M_M_AmbientLawRural_01")
					RequestModel(model)
					if not HasModelLoaded(model) then 
						RequestModel(model) 
					end
					while not HasModelLoaded(model) do 
						Citizen.Wait(1) 
					end
					local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 0))

					creePed = CreatePed(model, x+2, y+2 , z+2, 0, true, false, 0, 0)
					SetPedRelationshipGroupHash(creePed, 'ped')
					Citizen.InvokeNative(0x283978A15512B2FE, creePed, true)      
					Citizen.InvokeNative(0x23f74c2fda6e7c61, -700928964, creePed)
					GiveWeaponToPed_2(creePed, 0xA84762EC, 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
               		SetCurrentPedWeapon(creePed, 0xA84762EC, true)
					SetEntityCanBeDamagedByRelationshipGroup(creePed, false, 'ped') 
					-- SetPedCombatMovement(creePed,3)
					-- TaskWanderStandard(creePed, 1, 1)
					SetPedAsGroupMember(creePed, GetPedGroupIndex(PlayerPedId()))
		 
					-- SetModelAsNoLongerNeeded(model)
		
		
 end)

 RegisterNetEvent('freeman')
 AddEventHandler('freeman', function(source, args) 
	AddRelationshipGroup('ped')
	AddRelationshipGroup('PlayerPed')
	local playerPed = PlayerPedId()

					model = GetHashKey("CS_MP_SHERIFFFREEMAN")
					RequestModel(model)
					if not HasModelLoaded(model) then 
						RequestModel(model) 
					end
					while not HasModelLoaded(model) do 
						Citizen.Wait(1) 
					end
					local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 0))

					creePed = CreatePed(model, x+2, y+2 , z+2, 0, true, false, 0, 0)
					SetPedRelationshipGroupHash(creePed, 'ped')
					Citizen.InvokeNative(0x283978A15512B2FE, creePed, true)      
					Citizen.InvokeNative(0x23f74c2fda6e7c61, -700928964, creePed)
					GiveWeaponToPed_2(creePed, 0xA84762EC, 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
               		SetCurrentPedWeapon(creePed, 0xA84762EC, true)
					SetEntityCanBeDamagedByRelationshipGroup(creePed, false, 'ped') 
					-- SetPedCombatMovement(creePed,3)
					-- TaskWanderStandard(creePed, 1, 1)
					SetPedAsGroupMember(creePed, GetPedGroupIndex(PlayerPedId()))
		 
					-- SetModelAsNoLongerNeeded(model)
		
		
 end)

 RegisterNetEvent('larry')
 AddEventHandler('larry', function(source, args) 
	AddRelationshipGroup('ped')
	AddRelationshipGroup('PlayerPed')
	local playerPed = PlayerPedId()

					model = GetHashKey("S_M_M_DispatchLawRural_01")
					RequestModel(model)
					if not HasModelLoaded(model) then 
						RequestModel(model) 
					end
					while not HasModelLoaded(model) do 
						Citizen.Wait(1) 
					end
					local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 0))

					creePed = CreatePed(model, x+2, y+2 , z+2, 0, true, false, 0, 0)
					SetPedRelationshipGroupHash(creePed, 'ped')
					Citizen.InvokeNative(0x283978A15512B2FE, creePed, true)      
					Citizen.InvokeNative(0x23f74c2fda6e7c61, -700928964, creePed)
					GiveWeaponToPed_2(creePed, 0xA84762EC, 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
               		SetCurrentPedWeapon(creePed, 0xA84762EC, true)
					SetEntityCanBeDamagedByRelationshipGroup(creePed, false, 'ped') 
					-- SetPedCombatMovement(creePed,3)
					-- TaskWanderStandard(creePed, 1, 1)
					SetPedAsGroupMember(creePed, GetPedGroupIndex(PlayerPedId()))
		 
					-- SetModelAsNoLongerNeeded(model)
		
		
 end)



 