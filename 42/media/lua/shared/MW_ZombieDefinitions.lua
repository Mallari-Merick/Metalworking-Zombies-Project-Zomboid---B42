require 'NPCs/ZombiesZoneDefinition'

local function AddMetalworkingZombies()
    local metalworkingSpawnChance = SandboxVars.MW.MetalworkingSpawnChance
    if metalworkingSpawnChance > 0.0 then
        table.insert(ZombiesZoneDefinition.Default, {name = "MW_MetalworkingZombie", chance = metalworkingSpawnChance})
    end
end

if isServer() then
    Events.OnServerStarted.Add(AddMetalworkingZombies)
else
    Events.OnPostDistributionMerge.Add(AddMetalworkingZombies)
end