local copypaste = {
	dependencies = {
		items = {
			"set_cry_epic",
			"set_cry_code",
		},
	},
	object_type = "Joker",
	name = "cry-copypaste",
	key = "copypaste",
	pos = { x = 3, y = 4 },
	order = 302,
	config = {
		extra = {
			odds = 2,
			ckt = nil,
		},
	}, -- what is a ckt
	rarity = "cry_epic",
	cost = 14,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card and cry_prob(
					math.min(card.ability.extra.odds / 2, card.ability.cry_prob or 1),
					card.ability.extra.odds,
					card.ability.cry_rigged
				) or 1,
				card and card.ability.extra.odds or 2,
			}, -- this effectively prevents a copypaste from ever initially misprinting at above 50% odds. still allows rigging/oops
			key = Cryptid.gameset_loc(self, { madness = "madness", exp_modest = "modest" }),
		}
	end,
	atlas = "atlasepic",
	extra_gamesets = { "exp_modest" },
	gameset_config = {
		exp_modest = { cost = 8, center = { rarity = 3 } },
	},
	calculate = function(self, card, context)
		if context.pull_card and context.card.ability.set == "Code" and Cryptid.gameset(card) == "exp_modest" then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				G.E_MANAGER:add_event(Event({
					func = function()
						local cards = copy_card(context.card)
						cards:add_to_deck()
						G.consumeables:emplace(cards)
						return true
					end,
				}))
				card_eval_status_text(
					context.blueprint_card or card,
					"extra",
					nil,
					nil,
					nil,
					{ message = localize("k_copied_ex") }
				)
			end
		end
		if
			context.using_consumeable
			and context.consumeable.ability.set == "Code"
			and not context.consumeable.beginning_end
			and not card.ability.extra.ckt
			and Cryptid.gameset(card) ~= "exp_modest"
		then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				if
					pseudorandom("cry_copypaste_joker")
					< cry_prob(
							math.min(card.ability.extra.odds / 2, card.ability.cry_prob),
							card.ability.extra.odds,
							card.ability.cry_rigged
						)
						/ card.ability.extra.odds
				then
					G.E_MANAGER:add_event(Event({
						func = function()
							local cards = copy_card(context.consumeable)
							cards:add_to_deck()
							G.consumeables:emplace(cards)
							return true
						end,
					}))
					card_eval_status_text(
						context.blueprint_cards or card,
						"extra",
						nil,
						nil,
						nil,
						{ message = localize("k_copied_ex") }
					)
					if Card.get_gameset(card) ~= "madness" then
						card.ability.extra.ckt = true
					end
				end
			end
		elseif
			context.end_of_round
			and not context.retrigger_joker
			and not context.blueprint
			and card.ability.extra.ckt
		then
			card.ability.extra.ckt = nil
			return {
				message = localize("k_reset"),
				card = card,
			}
		end
	end,
	cry_credits = {
		idea = {
			"Auto Watto",
		},
		art = {
			"Kailen",
		},
		code = {
			"Auto Watto",
		},
	},
}
