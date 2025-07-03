SMODS.Joker {
    key = "scarabHand",
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = { h_size = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.h_size * G.GAME.pharahos_scarabs } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size * G.GAME.pharahos_scarabs)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size * G.GAME.pharahos_scarabs)
    end,
    calculate = function(self, card, context)
        if (context.end_of_round and not context.individual and not context.repetition and not context.blueprint) or context.forcetrigger then
            G.hand:change_size(card.ability.extra.h_size * G.GAME.pharahos_scarabs)
        end
    end
}

