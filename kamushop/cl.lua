ESX = nil


local Shop = {   
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_Green}, HeaderColor = {255, 255, 255}, --[[R, G, B   R = red G = Green B = Blue ]]Title = 'Shop'},
	Data = { currentMenu = "Action Shop :", GetPlayerName()},
    Events = { 
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
      PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
      local btn = btn.name
          if btn == "Pain" then  
 TriggerServerEvent('kamushop:test', 5, 'bread', 1)
          elseif btn == "Eau" then
 TriggerServerEvent('kamushop:test', 5, 'water', 1)
          elseif btn == "Telephone" then
 TriggerServerEvent('kamushop:test', 5, 'phone', 1)
             end 
	        end,     
	},    
	Menu = {  
		["Action Shop :"] = { 
			b = { 
        {name = "Pain", ask = "~g~$2", askX = true},  
        {name = "Eau", ask = "~g~$3", askX = true},
        {name = "Telephone", ask = "~g~$35", askX = true},        
			}  
		}

	}
}    


local shop = {
  {x = 25.651, y= -1346.872, z=29.49},
  {x = -1222.40, y= -906.968, z=12.32},
}

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0) 
      for k in pairs(shop) do
          local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
          local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, shop[k].x, shop[k].y, shop[k].z)
          if dist <= 2.0 then 
              ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ shop")
              if IsControlJustPressed(1,38) then 			
               CreateMenu(Shop)    
                  end
              end 
          end
      end
  end)

  Citizen.CreateThread(function()

    for k in pairs(shop) do

	local blip = AddBlipForCoord(shop[k].x, shop[k].y, shop[k].z)

	SetBlipSprite(blip, 59)
	SetBlipColour(blip, 2)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("LTD")
    EndTextCommandSetBlipName(blip)
    end
end)

