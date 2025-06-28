local path = "content/"


SMODS.load_file(path .. "Globals.lua")()
SMODS.load_file(path .. "Utils.lua")()
SMODS.load_file(path .. "Atlas.lua")()

-- Jokers
SMODS.load_file(path .. "Jokers.lua")()

-- Enhancements
SMODS.load_file(path .. "Enhancements.lua")()

-- New counters
SMODS.load_file("content/scarab.lua")()