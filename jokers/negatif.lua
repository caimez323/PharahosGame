SMODS.Joker {
	dependencies = {
		items = {
			"set_cry_misc_joker",
		},
	},
	name = "cry-meteor",
	key = "meteor",
	pos = { x = 0, y = 2 },
	config = { extra = { chips = 75 } },
	loc_vars = function(self, info_queue, center)
		if not center.edition or (center.edition and not center.edition.foil) then
			info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
		end
		return { vars = { number_format(center.ability.extra.chips) } }
	end,
	rarity = 1,
	cost = 4,
	order = 38,
	blueprint_compat = true,
	demicoloncompat = true,
	calculate = function(self, card, context)
		if
			context.other_joker
			and context.other_joker.edition
			and context.other_joker.edition.foil == true
			and card ~= context.other_joker
		then
			if not Talisman.config_file.disable_anims then
				G.E_MANAGER:add_event(Event({
					func = function()
						context.other_joker:juice_up(0.5, 0.5)
						return true
					end,
				}))
			end
			return {
				message = localize({
					type = "variable",
					key = "a_chips",
					vars = { number_format(card.ability.extra.chips) },
				}),
				chip_mod = lenient_bignum(card.ability.extra.chips),
			}
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.edition and context.other_card.edition.foil == true then
				return {
					chips = lenient_bignum(card.ability.extra.chips),
					colour = G.C.CHIPS,
					card = card,
				}
			end
		end
		if
			context.individual
			and context.cardarea == G.hand
			and context.other_card.edition
			and context.other_card.edition.foil == true
			and not context.end_of_round
		then
			if context.other_card.debuff then
				return {
					message = localize("k_debuffed"),
					colour = G.C.RED,
					card = card,
				}
			else
				return {
					chips = lenient_bignum(card.ability.extra.chips), --this doesn't exist yet :pensive: if only...
					card = card,
				}
			end
		end
		if context.forcetrigger then
			return {
				chips = lenient_bignum(card.ability.extra.chips),
				colour = G.C.CHIPS,
				card = card,
			}
		end
	end,
	atlas = "Jokers",
}