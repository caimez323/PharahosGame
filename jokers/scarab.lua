SMODS.Joker {
	name = "Scarab Card",
	key = 'Scarab',
	config = { extra = { pyrox = 1, increase = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.pyrox, card.ability.extra.increase } }
	end,
	rarity = 1,
	atlas = "Jokers",
	pos = { x = 4, y = 4 },
	cost = 3,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if (context.end_of_round and context.game_over == false and not context.repetition) or context.forcetrigger then
				ease_pyrox(card.ability.extra.pyrox)
				return {
					message = "+" .. card.ability.extra.pyrox .. "¤",
					colour = G.C.BLUE,
				}
		end
	end
}