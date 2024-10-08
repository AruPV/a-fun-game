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
	print("Acting:")
	print(plant_array)
	for plant in plant_array:
		print("Acting on:" + plant.grid_position)
		plant.cur_mana += output_mana
	return cur_mana

func effect_positions() -> Array:
	return direction_transform.at(grid_position)
