SMODS.Joker {
    key = "Hugo",
	loc_txt = {
		name = 'Hugo',
		text = {
			"Gains {C:chips}+#1#{} Chips per joker",
		}
	},
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'Jokers',
    pos = { x = 0, y = 0 },
    config = { extra = { chips = 25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * (G.jokers and #G.jokers.cards or 0) * G.GAME.pharahos_scarabs} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            -- THX to vanillaRemade : 
            local joker_count = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then joker_count = joker_count + 1 end
            end
            return {
                chips = card.ability.extra.chips * joker_count * math.max(1,G.GAME.pharahos_scarabs)
            }
        end
    end,
}
