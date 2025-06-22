SMODS.Joker {
	key = 'InstructionsOfKagemi',
	loc_txt = {
		name = 'Instructions Of Kagemi',
		text = {
			"Gains {C:chips}+#2#{} Chips",
			"per remaingin card in your hand.",
			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
		}
	},
	config = { extra = { chips = 0, chip_gain = 2 } },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 0, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		if context.after and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain*#G.hand.cards
			return {
				message = '+' .. card.ability.extra.chips .. ' Chips',
				colour = G.C.CHIPS,
				card = card
			}
		end
	end
}