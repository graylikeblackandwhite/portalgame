class_name PortalSpawner
extends Node2D


const PORTAL = preload("res://Scenes/portal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_portal(portal_position: Vector2, portal_rotation: float):
	var instance = PORTAL.instantiate()
	instance.spawn_pos = portal_position
	instance.spawn_rot = portal_rotation
	owner.owner.add_child(instance)
	
