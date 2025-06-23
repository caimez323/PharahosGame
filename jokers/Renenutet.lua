SMODS.Joker {
    key = "Renenutet",
    loc_txt = {
        name = 'Renenutet',
        text = {
            "OUI",
            "{C:money}#1#%{}"
        }
    },
    blueprint_compat = true,
    pos = { x = 2, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = "Jokers",
    config = {
		extra = {
			percent = 50,
            percent_mod = 1,
            lastHand = 0,

		},
	},
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                number_format(center.ability.extra.percent),
                number_format(center.ability.extra.percent_mod),
            },
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            card.ability.extra.lastHand = #context.full_hand
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if card.ability.extra.lastHand == 1 then
                print(card.ability.extra.percent)
                print(card.ability.extra.percent_mod)
                card.ability.extra.percent = lenient_bignum(to_big(card.ability.extra.percent) + card.ability.extra.percent_mod)
                print(card.ability.extra.percent)
                return {
                    message = "Upgrade",
                    colour = G.C.MONEY,
                }
            end
            card.ability.extra.lastHand = 0
        end
    end,

    calc_dollar_bonus = function(self, card)
        local bonus =
        lenient_bignum(math.max(0, math.floor(0.01 * to_big(card.ability.extra.percent) * (G.GAME.dollars or 0))))
		if to_big(bonus) > to_big(0) then
			return bonus
		end
    end
}