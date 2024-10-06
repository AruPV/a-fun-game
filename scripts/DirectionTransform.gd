extends Node
# 
class_name DirectionTransform

var transforms = []
var dir_strings = []
var dir_dict = {
	"ul": Vector2(-1,-1), "u": Vector2(-1,0), "ur": Vector2(-1,1),
	"l": Vector2(-1,0), "o": Vector2(0,0), "r": Vector2(0,1),
	"dl": Vector2(-1,1), "d": Vector2(0,1), "dr": Vector2(1,1)
}

func _init(dir_array: Array) -> void:
	dir_strings = dir_array
	for dir in dir_array:
		transforms.append(dir_dict[dir])

func at(point: Vector2)-> Array:
	var new_array = []
	for transform in transforms:
		new_array.append(transform*point)
	return new_array
