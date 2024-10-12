local grenade = table.deepcopy(data.raw["capsule"]["grenade"])
local grenade_trigger = table.deepcopy(data.raw["projectile"]["grenade"]["action"])


grenade.name = "ch-grenade-primed"
grenade.spoil_ticks = 4 * 60
-- copied from grenade projectile
grenade.spoil_to_trigger_result =
{
	trigger = grenade_trigger,
	items_per_trigger = 1,
}
grenade.stack_size = 1

local recipe = {
	type = "recipe",
	name = "ch-pull-the-pin",
	enabled = false,
	energy_required = 0.1,
	result_is_always_fresh = true,
	ingredients =
	{
		{ type = "item", name = "grenade", amount = 1 }
	},
	results = { { type = "item", name = "ch-grenade-primed", amount = 1 } }
}

data:extend({ grenade })
data:extend({ recipe })


table.insert(data.raw["technology"]["military-2"].effects, {
	type = "unlock-recipe",
	recipe = "ch-pull-the-pin"
})
