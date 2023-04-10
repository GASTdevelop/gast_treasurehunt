Config = {}

Config.Ox = false
Config.Locale = "cs"

Config.OpenKey = 51
Config.DrawDistance = 1

Config.Cooldown = 1000
Config.AnimationTime = 15000
Config.Scenario = "WORLD_HUMAN_GARDENER_PLANT"
Config.ItemNeeded = 'lopata'

Config.Zones = {
  Treasure = {
		Pos = {
          {x = 1925.39, y = 3986.1, z = 32.03},
          {x = 1977.72, y = 3932.43, z = 32.64},
          {x = 2009.10, y = 3934.25, z = 32.37},
          {x = 2032.86, y = 3893.78, z = 31.82},
          {x = 2068.35, y = 3867.26, z = 31.82},
          {x = 1788.31, y = 3974.15, z = 32.41}
	 	}
  }
}

Config.Items = {
  [1] = {chance = 1, id = 'old_key', name = 'Stare kluce', quantity = math.random(1,3), limit = 10},
  [2] = {chance = 2, id = 'old_wallet', name = 'Stara penazenka', quantity = 1, limit = 10},
  [3] = {chance = 2, id = 'old_ring', name = 'Stary prsten', quantity = 1, limit = 10},
  [4] = {chance = 2, id = 'old_chain', name = 'Stara retiazka', quantity = 1, limit = 10},
  [5] = {chance = 3, id = 'silver_ring', name = 'Strieborny prsten', quantity = math.random(1,8), limit = 10}
}