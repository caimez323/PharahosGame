SMODS.Joker {
	key = 'pauvre',
	loc_txt = {
		name = 'Pauvre',
		text = {
			"fait que la carte avec la plus petit",
            "se suppr et donne des sous",
            "Non figure"
		}
	},
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 1, y = 0 },
	cost = 5,
    config = { extra = { lower = 100 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.lower } }
    end,

	calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            local lower_card = nil
            local lower_card_value = 1000
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() < lower_card_value then
                    lower_card_value = context.scoring_hand[i]:get_id()
                    card.ability.extra.lower = lower_card_value
                end
            end
        end
		if context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            for i=1, #context.scoring_hand do
                if tonumber(context.destroying_card.base.value) == tonumber(card.ability.extra.lower) then
                    card.ability.extra.lower = 1000+card.ability.extra.lower
                    G.GAME.dollars = G.GAME.dollars + (card.ability.extra.lower - 1000)*2
                    return {
                        message = "+" .. (card.ability.extra.lower - 1000)*2 .. " $",
                        remove = true
                    }
                end
            end
        end
	end
}