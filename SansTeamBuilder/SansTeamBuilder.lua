SansTeamBuilder = LibStub("AceAddon-3.0"):NewAddon("SansTeamBuilder", "AceConsole-3.0")
local SansLibs = LibStub("SansLibs-1.0")

local addon_name = ...
local addon_title = "<"..SansLibs:Colorfy("San's",SansLibs.ColorfyColors.red).." "..SansLibs:Colorfy("Team Builder",SansLibs.ColorfyColors.yellow)..">"
local addon_version = GetAddOnMetadata(addon_name,"Version")

local myMessageVar
local options = {
    name = addon_title,
    handler = SansTeamBuilder,
    type = 'group',
    args = {
        msg = {
            type = 'input',
            name = 'My Message',
            desc = 'The message for my addon',
            set = 'SetMyMessage',
            get = 'GetMyMessage',
        },
    },
}

function SansTeamBuilder:OnInitialize()
    -- Code that you want to run when the addon is first loaded goes here.
    SansLibs:Msg(SansLibs:Colorfy("Version "..addon_version,SansLibs.ColorfyColors.orange).." Loaded!", addon_title)
    self.config = LibStub("AceConfig-3.0"):RegisterOptionsTable(addon_name, options, {"stb", "sansteambuilder", "teambuilder"})
    self.db = LibStub("AceDB-3.0"):New(addon_name.."DB")
end

function SansTeamBuilder:GetMyMessage(info)
    SansLibs:Msg("Getting",addon_title)
    return myMessageVar
end

function SansTeamBuilder:SetMyMessage(info, input)
    SansLibs:Msg("Setting",addon_title)
    myMessageVar = input
end
