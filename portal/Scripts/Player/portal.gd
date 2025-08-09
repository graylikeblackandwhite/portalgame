class_name Portal
extends Node2D

@export var timer_max : float 

@onready var teleport_area : Area2D = $Area2D

var portal1 : Portal
var portal2 : Portal

var spawn_pos : Vector2
var spawn_rot : float

var timer = 0

var recently_teleported = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos
	global_rotation = spawn_rot
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer >= timer_max:
		queue_free()

func _on_portal_entered(body:Node2D) -> void:
	if !portal1 or !portal2: 
		pass
	elif !portal1.recently_teleported and !portal2.recently_teleported:
		if self == portal1:
			body.position = portal2.position
			body.velocity = portal2.transform.x * body.velocity.length()
		else:
			body.position = portal1.position
			body.velocity = portal1.transform.x  * body.velocity.length()

		portal1.recently_teleported = true
		portal2.recently_teleported	= true

func _on_portal_exited(body:Node2D) -> void:
	if !portal1 or !portal2: 
		pass
	elif portal1.recently_teleported and portal2.recently_teleported:
		portal1.recently_teleported = false
		portal2.recently_teleported = false
