class_name Cell extends Node2D

var strength: float
var instance_name: String

func _init(instance_name, strength = 1):
	self.instance_name = instance_name
	self.strength = strength


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
