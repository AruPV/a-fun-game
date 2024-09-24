extends Node2D
const y_count = 5
const x_count = 5
var cells: Array[Cell] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("grid loaded")
	for i in x_count*y_count:
		cells.append(Cell.new())
	for cell in cells:
		print("cell")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
