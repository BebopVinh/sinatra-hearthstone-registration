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
   {name: "Deathrattle", archetype: "Midrange", profession_id: 6},
   {name: "Odd", archetype: "Aggro", profession_id: 6},
   {name: "Ressurect", archetype: "Combo", profession_id: 5}
])

countries = Country.create([
   {name: "Germany"},
   {name: "South Korea"},
   {name: "Taiwan"}
])

players = Player.create([
   {name: "Luo Shengyuan", username: "roger", email: "roger@ahq.com", password: "hearthstone", country_id: 3,},
   {name: "Raphael Peltzer", username: "bunnyhoppor", email: "bunnyhoppor@samsung.com", password: "hearthstone", country_id: 1},
   {name: "Kim Jung-soo", username: "surrender", email: "surrender@sk.com", password: "hearthstone", country_id: 2}
])


