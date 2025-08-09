class_name Portal
extends Node2D

@export var timer_max : float 

var spawn_pos : Vector2
var spawn_rot : float

var timer = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos
	global_rotation = spawn_rot
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer >= timer_max:
		queue_free()
	else:
		timer += delta
