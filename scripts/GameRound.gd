extends Node2D

@onready var game_grid = $game_grid
@onready var point_counter = $Points
var cur_points = 0

func _on_button_button_up() -> void:
	cur_points += game_grid.point_calculation()
	print(cur_points)
	
