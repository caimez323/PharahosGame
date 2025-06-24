SMODS.Joker {
	key = 'OldsRags',
	loc_txt = {
		name = 'Olds Rags',
		text = {
			"Gains {C:mult}+#2#{} mult",
			"per remaingin card in your hand.",
			"{C:inactive}(Currently {C:mult}+#1#{C:inactive} mult)"
		}
	},
	config = { extra = { mult = 0, mult_gain = 2 } },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 1, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end
		if context.before and not context.blueprint and not card.debuff then
            local usless_cards = 0
            for i=1, #context.full_hand do
                local card_is_scoring = false
                for j=1, #context.scoring_hand do
                    if context.full_hand[i] == context.scoring_hand[j] then
                        card_is_scoring = true
                    end
                end 
                if card_is_scoring == false and not context.full_hand[i].debuff and not context.full_hand[i].clown_destroying then
                    usless_cards = usless_cards + 1
                end
            end
            if usless_cards > 0 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain*usless_cards
                return {
                    message = '+' .. card.ability.extra.mult_gain*usless_cards .. ' mult',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
	end
}