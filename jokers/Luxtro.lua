SMODS.Joker {
	key = 'Luxtro',
	loc_txt = {
		name = 'Luxtro',
		text = {
			"Gains +#1# jslots",
		}
	},
	config = {
		extra = {
			slots = 1,
		},
		immutable = {
			max_slots = 50,
		},
	},
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 0, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, center)
		return { vars = { self.config.extra.slots } }
	end,
	add_to_deck = function(self, card, from_debuff)
		local extra = math.min(card.ability.extra.slots * G.GAME.pharahos_scarabs, card.ability.immutable.max_slots)
		G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big(extra))
	end,
	remove_from_deck = function(self, card, from_debuff)
		local extra = math.min(card.ability.extra.slots * G.GAME.pharahos_scarabs, card.ability.immutable.max_slots)
		G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit - to_big(extra))
	end,
	calculate = function(self, card, context)
        if (context.end_of_round and not context.individual and not context.repetition and not context.blueprint) or context.forcetrigger then
			local extra = math.min(card.ability.extra.slots * G.GAME.pharahos_scarabs, card.ability.immutable.max_slots)
            G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit  + extra)
        end
    end
}
