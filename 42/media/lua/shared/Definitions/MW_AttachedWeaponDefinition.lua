require "Definitions/AttachedWeaponDefinitions"

AttachedWeaponDefinitions.meleeInBack_MW = {
    id = "meleeInBack_MW",
    chance = 100,
    outfit = {"MW_MetalworkingZombie"},
    weaponLocation = {"Big Weapon On Back"},
    bloodLocations = nil,
    addHoles = false,
    daySurvived = 0,
    weapons = {
        "Base.Crowbar",
        "Base.TireIron",
        "Base.MetalBar",
        "Base.IronBar",
        "Base.BaseballBat",
        "Base.BaseballBat_Spiked",
        "Base.BaseballBat_RailSpike",
        "Base.BaseballBat_Metal",
    },
}

AttachedWeaponDefinitions.meleeInToolLeft_MW = {
    id = "meleeInToolLeft_MW",
    chance = 50,
    outfit = {"MW_MetalworkingZombie"},
    weaponLocation = {"Belt Left"},
    bloodLocations = nil,
    addHoles = false,
    daySurvived = 0,
    weapons = {
        "Base.BallPeenHammer",
        "Base.ClubHammer",
        "Base.Hammer",
    }
}

AttachedWeaponDefinitions.meleeInToolRight_MW = {
    id = "meleeInToolRight_MW",
    chance = 50,
    outfit = {"MW_MetalworkingZombie"},
    weaponLocation = {"Belt Right"},
    bloodLocations = nil,
    addHoles = false,
    daySurvived = 0,
    weapons = {
        "Base.BallPeenHammer",
        "Base.ClubHammer",
        "Base.Hammer",
    }
}

local function InitializeMetalworkingWeapons()
    AttachedWeaponDefinitions.attachedWeaponCustomOutfit = AttachedWeaponDefinitions.attachedWeaponCustomOutfit or {}

    AttachedWeaponDefinitions.attachedWeaponCustomOutfit.MW_MetalworkingZombie = {
        chance = 100,
        maxitem = 2,
        weapons = {
            AttachedWeaponDefinitions.meleeInBack_MW,
            AttachedWeaponDefinitions.meleeInToolLeft_MW,
            AttachedWeaponDefinitions.meleeInToolRight_MW,
        },
    }
end

Events.OnInitGlobalModData.Add(InitializeMetalworkingWeapons)
