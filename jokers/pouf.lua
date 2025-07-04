SMODS.Joker {
    key = "Pouf",
    blueprint_compat = false,
    rarity = 2,
    cost = 4,
    atlas = "Jokers",
    pos = { x = 0, y = 0 },
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v * 2
        end
    end,
}
