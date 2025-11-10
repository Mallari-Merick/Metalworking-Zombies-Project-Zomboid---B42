-- This part needs testing
function AddMetalworkingZombieLoot(zombie)
    if not zombie:getOutfitName()then return end
    local outfit = tostring(zombie:getOutfitName())

    if outfit == "MW_MetalworkingZombie" then
        local inv = zombie:getInventory()
        local backpackinv = nil

        -- Find equipped container
        for i = 0, inv:getItems():size()-1 do
            local item = inv:getItems():get(i)
            if item:getCategory()=="Container" and zombie:isEquipped(item) then
                backpackinv = item:getInventory()
                break
            end
        end

        -- Get Sandbox settings
        local SB = SandboxVars.MW or {}

        -- Build loot table from sandbox options
        local metalworkingLoot = {
            {item = "SheetMetal", chance = SB.SheetMetalChance or 20},
            {item = "CopperSheet", chance = SB.CopperSheetChance or 20},
            {item = "SmallSheetMetal", chance = SB.SmallSheetMetalChance or 35},
            {item = "SmallCopperSheet", chance = SB.SmallCopperSheetChance or 35},
            {item = "SteelScrap", chance = SB.SteelScrapChance or 35},
            {item = "ScrapMetal", chance = SB.ScrapMetalChance or 35},
            {item = "IronScrap", chance = SB.IronScrapChance or 35},
            {item = "AluminumScrap", chance = SB.AluminumScrapChance or 35},
            {item = "CopperScrap", chance = SB.CopperScrapChance or 35},
            {item = "UnusableMetal", chance = SB.UnusableMetalChance or 35},
            {item = "IronBar", chance = SB.IronBarChance or 25},
            {item = "MetalBar", chance = SB.MetalBarChance or 30},
            {item = "WeldingRods", chance = SB.WeldingRodsChance or 25},
            -- Add more items here if ever
        }

        -- Special Items (only getting once if successfully rolled)
        local specialItems = {
            {item = "BlowTorch", chance = SB.BlowTorchChance or 5},
        }

        for _, special in ipairs(specialItems) do
            if special.chance > 0 and ZombRand(100) < special.chance then
                if backpackinv then
                    backpackinv:AddItem(special.item)
                else
                    inv:AddItem(special.item)
                end
            end
        end

        -- Get number of items from sandbox
        local itemsToAdd = SB.ItemRolls or 30

        -- Add random items based on weights
        for i = 1, itemsToAdd do
            local totalWeight = 0

            -- Calculate total weight (skip items with 0 chance)
            for _, entry in ipairs(metalworkingLoot) do
                totalWeight = totalWeight + (entry.chance or 0)
            end

            if totalWeight > 0 then
                local random = ZombRand(0, totalWeight + 1)
                local currentWeight = 0

                -- Select item based on weight
                for _, entry in ipairs(metalworkingLoot) do
                    currentWeight = currentWeight + (entry.chance or 0)
                    if random < currentWeight then
                        if backpackinv then
                            backpackinv:AddItem(entry.item)
                        else
                            inv:AddItem(entry.item)
                        end
                        break
                    end
                end
            end
        end
    end
end

Events.OnZombieDead.Add(AddMetalworkingZombieLoot)