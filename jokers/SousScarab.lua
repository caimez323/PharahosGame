SMODS.Joker {
    key = "SousScarab",
    loc_txt = {
        name = 'SousScarab',
        text = {
            "1 ou 6"
        }
    },
    blueprint_compat = true,
    pos = { x = 2, y = 2 },
    rarity = 3,
    cost = 10,
    atlas = "Jokers",
    config = { extra = { dollar = 1, dollar_gain = 5 } },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                number_format(center.ability.extra.dollar),
                number_format(center.ability.extra.dollar_gain),
            },
        }
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.dollar
        if G.GAME.pharahos_scarabs >= 1 then
                bonus = bonus + card.ability.extra.dollar_gain
                remove_scarab(1)
        end
        return bonus
    end
}
