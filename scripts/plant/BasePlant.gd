extends Node2D
class_name Plant

var plant_name: String
var cur_mana: int = 0
var output_mana: int = 1
var direction_transform = DirectionTransform.new(["u","d","l","r"])
var grid_position = Vector2(0,0)

# A basic example of how the act function should be designed.
# Is called when the game decides that these are the 
func act(plant_array: Array) -> int:
	for plant in plant_array:
		plant.cur_mana += cur_mana
	return output_mana

func effect_positions() -> Array:
	return direction_transform.at(grid_position)
