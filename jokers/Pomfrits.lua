
SMODS.Joker {
	key = 'Pomfrits',
	loc_txt = {
		name = 'Pomfrits',
		text = {
			"Gains {C:chips}+#1#{} Chips",
		}
	},
	config = { extra = { chips = 0 } },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 0, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips * G.GAME.pharahos_scarabs,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips * G.GAME.pharahos_scarabs } }
			}
		end
	end
}
