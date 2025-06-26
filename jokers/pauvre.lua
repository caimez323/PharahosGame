SMODS.Joker {
	key = 'pauvre',
	loc_txt = {
		name = 'Pauvre',
		text = {
			"mult",
		}
	},
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 1, y = 0 },
	cost = 5,

	calculate = function(self, card, context)
		if context.after then
            local lower_card = nil
            local lower_card_value = 1000
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() <= lower_card_value then
                    lower_card_value = context.scoring_hand[i]:get_id()
                    lower_card = context.scoring_hand[i]
                end
            end
            print(lower_card_value)
            lower_card:remove()
            -- destroy_card = lower_card
            -- local usless_cards = 0
            -- for i=1, #context.full_hand do
            --     local card_is_scoring = false
            --     for j=1, #context.scoring_hand do
            --         if context.full_hand[i] == context.scoring_hand[j] then
            --             card_is_scoring = true
            --         end
            --     end 
            --     if card_is_scoring == false and not context.full_hand[i].debuff and not context.full_hand[i].clown_destroying then
            --         usless_cards = usless_cards + 1
            --     end
            -- end
            -- if usless_cards > 0 then
            --     card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain*usless_cards
            --     return {
            --         message = '+' .. card.ability.extra.mult_gain*usless_cards .. ' mult',
            --         colour = G.C.MULT,
            --         card = card
            --     }
            -- end
        end
	end
}