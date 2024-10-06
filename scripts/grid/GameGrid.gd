extends Node2D

var grass_layer: TileMapLayer
var plant_dict: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grass_layer = $grass_layer as TileMapLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func point_calculation() -> int:
	var point_output = 0
	for key in plant_dict:
		var cur_plant = plant_dict[key] as Plant
		var hypothetical_positions = cur_plant.effect_positions()
		point_output += cur_plant.act(valid_cells(hypothetical_positions))
	return point_output

func valid_cells(hypothetical_neighbours: Array) -> Array:
	var real_neighbours = []
	for neighbour_point in hypothetical_neighbours:
		var is_valid = grass_layer.get_cell_source_id(neighbour_point) != -1
		if is_valid && plant_dict.get(neighbour_point) != null:
			real_neighbours.append(plant_dict[neighbour_point])
	return real_neighbours

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("left_click")):
		var map_pos = grass_layer.get_cell_map_from_mouse()
		if (grass_layer.get_cell_source_id(map_pos) != -1):
			var grass_local = grass_layer.map_to_local(map_pos)
			var grass_global = grass_layer.to_global(grass_local)
			if (plant_dict.get(map_pos)== null):
				var scene = load("res://scenes/plants/plant.tscn")
				var scene_instance = scene.instantiate()
				scene_instance.set_name("plant")
				add_child(scene_instance)
				plant_dict[map_pos] = scene_instance
				scene_instance.position = grass_global
			else:
				var dead_plant = plant_dict[map_pos]
				dead_plant.queue_free()
				plant_dict.erase(map_pos)
				
			print(plant_dict)
		elif (true):
			pass
