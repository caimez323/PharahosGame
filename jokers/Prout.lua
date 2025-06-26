SMODS.Joker {
    name = "Prout",
    key = "Prout",
    atlas = "Jokers",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    calculate = function(self, card, context)
        if context.joker_main then
            print(G.GAME.pharahos_scarabs)
            return true
        end
    end
}