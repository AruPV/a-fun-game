extends Node2D
const y_count = 5
const x_count = 5
var cells: Array[Cell] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("grid loaded")
	for i in x_count*y_count:
		cells.append(Cell.new(str(i+1)))
	for cell in cells:
		print(cell.instance_name)

func _get_neighbours_index(index: int)-> Dictionary:
	var up_index = index - y_count
	if up_index < 0:
		up_index = null
	var down_index = index + y_count
	if down_index > (y_count*x_count)-1:
		down_index = null
	var right_index = index + 1
	# Check that index and right_index are on the same row
	if floor((right_index+1)/x_count) != floor(index+1/x_count):
		right_index = null
	var left_index = index - 1 
	if floor((left_index+1)/x_count) != floor(left_index+1/x_count):
		right_index = null
	return { "up": up_index, "right": right_index, "down": down_index, "left": left_index }
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
