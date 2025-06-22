SMODS.Enhancement {
    key = "decrepit",
    atlas = "Enhancers",
    pos = { x = 0, y = 0},

    replace_base_card = true,



    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, pg_sand_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end
}