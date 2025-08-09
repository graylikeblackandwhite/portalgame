extends CharacterBody2D

@onready var portal_spawner = $PortalSpawn
@onready var sprite : Sprite2D = $Sprite2D

# public vars
@export var speed : float = 300.0
@export var jump_velocity : float = -400.0
@export var portal_radius : float = 100

var sprite_flipped = false;


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity

	sprite.flip_h = sprite_flipped

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		sprite_flipped = true if direction > 0 else false
		velocity.x = move_toward(velocity.x , direction * speed, speed)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			var portal_position = position + ((event.position - global_position).normalized() * portal_radius); 
			portal_spawner.spawn_portal(portal_position, self.get_angle_to(event.position))
		
