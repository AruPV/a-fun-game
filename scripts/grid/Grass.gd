extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var local_value = map_to_local(Vector2i(0,1))
	pass


func get_cell_map_from_mouse() -> Vector2i:
	return local_to_map(get_local_mouse_position())
