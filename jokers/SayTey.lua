SMODS.Joker {
	key = 'SayTey',
	loc_txt = {
		name = 'SayTey',
		text = {
			"Rettriger {C:mult}+#1#{} fois",
			"joker à droite"
		}
	},
	config = {
		extra = { retriggers = 1 },
		immutable = { max_retriggers = 25 },
	},
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 0, y = 0 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, center)
		return { vars = { math.min(center.ability.immutable.max_retriggers, center.ability.extra.retriggers * G.GAME.pharahos_scarabs) } }
	end,
	calculate = function(self, card, context)
		local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then my_pos = i; break end
        end
		if context.retrigger_joker_check then
			if my_pos and G.jokers.cards[my_pos + 1] and context.other_card == G.jokers.cards[my_pos + 1] then
				return {
					message = localize("k_again_ex"),
					repetitions = to_number(
						math.min(card.ability.immutable.max_retriggers, card.ability.extra.retriggers * G.GAME.pharahos_scarabs)
					),
					card = card,
				}
			end
		end
	end,
}
