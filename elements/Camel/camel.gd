extends CharacterBody2D

const SPEED: float = 100.0
const JUMP_VELOCITY: float = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float):
	
	if not is_on_floor():
		velocity.y += gravity * delta 	# affecting character by gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY	# lifting up a character by the amount of px in JUMP_VELOCITY
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
