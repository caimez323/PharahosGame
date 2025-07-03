SMODS.Joker {
	key = 'Luxtro',
	loc_txt = {
		name = 'Luxtro',
		text = {
			"Gains +#1# Chips",
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
		card.ability.extra.slots = math.min(card.ability.extra.slots * G.GAME.pharahos_scarabs, card.ability.immutable.max_slots)

		G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit + to_big((card.ability.extra.slots)))
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = lenient_bignum(G.jokers.config.card_limit - to_big((card.ability.extra.slots * G.GAME.pharahos_scarabs)))
	end,
}
