SMODS.Joker {
	loc_txt= {
		name = "Scarab Hive",
	},
	key = 'ScarabHive',
	config = { extra = { scarab = 1, increase = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.scarab, card.ability.extra.increase } }
	end,
	rarity = 1,
	atlas = "Jokers",
	pos = { x = 4, y = 4 },
	cost = 3,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if (context.end_of_round and context.game_over == false and not context.repetition) or context.forcetrigger then
				ease_scarab(card.ability.extra.scarab)
				return {
					message = "+" .. card.ability.extra.scarab .. "¤",
					colour = G.C.BLUE,
				}
		end
	end
}