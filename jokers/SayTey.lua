SMODS.Joker {
	key = 'SayTey',
	loc_txt = {
		name = 'SayTey',
		text = {
			"Rettriger {C:mult}+#1#{} fois",
			"Le plus à droite"
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
		if context.retrigger_joker_check then
			print(context.retrigger_joker_check, context.retrigger_joker, context.other_card ~= self)
			if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
				print("ici")
				if context.other_card == G.jokers.cards[1] then
					print("ici 2")
					return {
						message = localize("k_again_ex"),
						repetitions = to_number(
							math.min(card.ability.immutable.max_retriggers, card.ability.extra.retriggers * G.GAME.pharahos_scarabs)
						),
						card = card,
					}
				else
					return nil, true
				end
			end
		end
	end,
}
