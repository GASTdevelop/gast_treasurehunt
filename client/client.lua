ESX = exports["es_extended"]:getSharedObject()

local initialCooldownSeconds = 60
local cooldownSecondsRemaining = 0

Citizen.CreateThread(function()
	if Config.Ox == true then
		exports.ox_target:addSphereZone({
			coords = vec3(1925.39, 3986.1, 31.03),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos1',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coins',
					label = _U('start_treasure'),
				}
			}
		})

		exports.ox_target:addSphereZone({
			coords = vec3(1977.72, 3932.43, 32.64),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos2',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coins',
					label = _U('start_treasure'),
				}
			}
		})

		exports.ox_target:addSphereZone({
			coords = vec3(2009.10, 3934.25, 31.37),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos3',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coins',
					label = _U('start_treasure'),
				}
			}
		})

		exports.ox_target:addSphereZone({
			coords = vec3(2032.86, 3893.78, 32.82),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos4',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coins',
					label = _U('start_treasure'),
				}
			}
		})

		exports.ox_target:addSphereZone({
			coords = vec3(2068.35, 3867.26, 30.82),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos5',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coins',
					label = _U('start_treasure'),
				}
			}
		})

		exports.ox_target:addSphereZone({
			coords = vec3(1788.31, 3974.15, 32.41),
			radius = 1,
			debug = drawZones,
			options = {
				{
					name = 'pos6',
					event = 'gast_treasurehunt:event',
					icon = 'fa-solid fa-coinss',
					label = _U('start_treasure'),
				}
			}
		})

	else 
		while true do
			Citizen.Wait(0)
			local coords = GetEntityCoords(GetPlayerPed(-1))

			for k,v in pairs(Config.Zones) do
            	for i = 1, #v.Pos, 1 do
			    	if GetDistanceBetweenCoords(coords, v.Pos[i].x, v.Pos[i].y, v.Pos[i].z, true) < Config.DrawDistance then
						if cooldownSecondsRemaining <= 0 then
							drawtext(0.94, 1.2 ,1.0,1.0,0.6,_U('start_treasuretext'), 255,255,255,250, 1)
					
							if IsControlJustReleased(0, Config.OpenKey) then
								Event()
							end
						else
							local minutes = math.floor(cooldownSecondsRemaining / 60) -- divide the total seconds remaining by 60 to get minutes, pass it to math.floor to strip off the decimals
							local seconds = cooldownSecondsRemaining - minutes * 60 -- get the seconds left that don't make up a full minute
							local cooldownMessage = string.format(" Cooldown", minutes, seconds)
						end
					end
                end
			end
		end
	end
end)

function Event()
	TriggerServerEvent('gast_treasurehunt:reward')
end

RegisterNetEvent('gast_treasurehunt:event')
AddEventHandler('gast_treasurehunt:event', function()
	TriggerServerEvent('gast_treasurehunt:reward')
end)

RegisterNetEvent('gast_treasurehunt:animacion')
AddEventHandler('gast_treasurehunt:animacion', function(name)
	ESX.Progressbar(_U('start_progressbar'), Config.AnimationTime,{
		FreezePlayer = true, 
		animation ={
			type = "Scenario",
			Scenario = Config.Scenario, 
		},
		onFinish = function()
			ok = true
			handleCooldown()
	end, onCancel = function()
		--Code here
	end
	})
end)

function drawtext(x,y ,width,height,scale, text, r,g,b,a, font)
	SetTextFont(6)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

function handleCooldown()
    cooldownSecondsRemaining = initialCooldownSeconds
    Citizen.CreateThread(function()
        while cooldownSecondsRemaining > 0 do
            Citizen.Wait(Config.Cooldown)
            cooldownSecondsRemaining = cooldownSecondsRemaining - 1
        end
    end)
end