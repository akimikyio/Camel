extends CharacterBody2D

const SPEED = 100
const SPEED_COEFF = 0.5;
var direction = Vector2.RIGHT

func _process(_delta):
	velocity = SPEED * direction
	
	if Input.is_action_pressed("left"):
		velocity *= 1 - SPEED_COEFF
	if Input.is_action_pressed("right"):
		velocity *= 1 + SPEED_COEFF
	move_and_slide()
