local old_igo = Game.init_game_object
function Game:init_game_object()
	local ret = old_igo(self)
	ret.pharahos_scarabs = 0
	return ret
end

function ease_scarab(mod, instant)
	if mod == 0 then return end
	local function _mod(mod)
		local dollar_UI = G.HUD:get_UIE_by_ID('scarab_text_UI')
		mod = mod or 0
		local text = '+' .. localize('$')
		local col = G.C.BLUE
		if mod < 0 then
			text = '-' .. localize('$')
			col = G.C.RED
		end
		--Ease from current chips to the new number of chips
		G.GAME.pharahos_scarabs = G.GAME.pharahos_scarabs + mod
		dollar_UI.config.object:update()
		G.HUD:recalculate()
		--Popup text next to the chips in UI showing number of chips gained/lost
		attention_text({
			text = text .. tostring(math.abs(mod)),
			scale = 0.5,
			hold = 0.7,
			cover = dollar_UI.parent,
			cover_colour = col,
			align = 'cm',
		})
		--Play a chip sound
		play_sound('coin1')
	end
	if instant then
		_mod(mod)
	else
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				_mod(mod)
				return true
			end
		}))
	end
end

function add_scarab(amount)
    if amount > 0 then
        ease_scarab(amount)
    end
end

-- Fonction pour enlever des scarabs
function remove_scarab(amount)
    if amount > 0 and G.GAME.pharahos_scarabs >= amount then
        ease_scarab(-amount)
        return true -- Succès
    end
    return false -- Échec (pas assez de scarabs)
end

-- Fonction pour définir directement le montant
function set_scarab(amount)
    local current = G.GAME.pharahos_scarabs
    local diff = amount - current
    if diff ~= 0 then
        ease_scarab(diff, true) -- Instantané
    end
end