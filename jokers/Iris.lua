SMODS.Joker {
    loc_txt= {
        name = "Iris",
    },
    key = "Iris",
    atlas = "Jokers",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    config = { extra = { Xmult = 1} },
     loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult * G.GAME.pharahos_scarabs
            }
        end
    end,
}