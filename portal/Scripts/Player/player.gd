extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var sprite_flipped = false;

@onready var sprite : Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	sprite.flip_h = sprite_flipped

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		sprite_flipped = true if direction > 0 else false
		velocity.x = move_toward(velocity.x , direction * SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
