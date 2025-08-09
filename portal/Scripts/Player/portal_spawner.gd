class_name PortalSpawner
extends Node2D


@onready var PORTAL = preload("res://Scenes/portal.tscn")

var previous_portal : Portal = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn_portal(portal_position: Vector2, portal_rotation: float, ):
	var instance = PORTAL.instantiate()
	instance.spawn_pos = portal_position
	instance.spawn_rot = portal_rotation

	# pairs portals
	if previous_portal == null:
		previous_portal = instance
		instance.portal1 = instance
	else:
		instance.portal1 = previous_portal
		instance.portal2 = instance
		previous_portal.portal2 = instance

		previous_portal = null

	owner.owner.add_child(instance)
	
