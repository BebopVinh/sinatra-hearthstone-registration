professions = Profession.create([
   {name: "Druid"},
   {name: "Hunter"},
   {name: "Mage"},
   {name: "Paladin"},
   {name: "Priest"},
   {name: "Rogue"},
   {name: "Shaman"},
   {name: "Warlock"},
   {name: "Warrior"}
])

sample_decks = Deck.create([
   {name: "Deathrattle", archetype: "Midrange", profession_id: 6, creator_id: 1},
   {name: "Odd", archetype: "Aggro", profession_id: 6, creator_id: 1},
   {name: "Ressurect", archetype: "Combo", profession_id: 5, creator_id: 1}
])

countries = Country.create([
   {name: "Germany"},
   {name: "South Korea"},
   {name: "Taiwan"}
])

players = Player.create([
   {username: "roger", email: "roger@ahq.com", password: "hearthstone",
      email_confirmation: "roger@ahq.com", password_confirmation: "hearthstone", country_id: 3,},
   {username: "bunnyhoppor", email: "bunnyhoppor@samsung.com", password: "hearthstone", 
      email_confirmation: "bunnyhoppor@samsung.com", password_confirmation: "hearthstone", country_id: 1},
   {username: "surrender", email: "surrender@sk.com", password: "hearthstone", 
      email_confirmation: "surrender@sk.com", password_confirmation: "hearthstone", country_id: 2}
])


