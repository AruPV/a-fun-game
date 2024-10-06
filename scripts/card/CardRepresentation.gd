extends Area2D
var dragged = false
var grab_point: Vector2
@onready var target_scale = self.scale
var grow_amount = 1.05
var grow_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if (event.is_action_pressed("left_click")):
		dragged = true
		grab_point = get_local_mouse_position()
	elif (event.is_action_released("left_click")):
		dragged = false
	elif (event.is_class("InputEventMouseMotion")):
		pass
	else:
		print(event)

func _mouse_enter() -> void:
	target_scale *= grow_amount
	
func _mouse_exit() -> void:
	target_scale /= grow_amount

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragged:
		var new_pos = get_global_mouse_position() + grab_point
		print(get_global_mouse_position())
		print(grab_point)
		self.global_position = new_pos
	scale = lerp(self.scale, target_scale, delta * grow_speed)
