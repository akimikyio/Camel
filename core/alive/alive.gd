extends Entity
class_name Alive

# parameters properites
@export var max_health: int
@export var health: int
@export var max_defence: int
@export var defence: int

# physics properties
@export var jump_velocity: float
@export var speed: float
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# TODO: Make FSM (Finite-State-Machine) instead of it

# states variables
var is_attacking: bool = false
var is_alive: bool = true

func health_change(amount: int):
	health += amount
	$HealthBar.value = health
	if is_alive and health <= 0:
		death()

func max_health_change(amount: int):
	max_health += amount
	$HealthBar.max_value = health

func defence_change(amount: int):
	defence += amount

func max_defence_change(amount: int):
	max_defence += amount

func death():
	$AnimationPlayer.play("death")
	await $AnimationPlayer.animation_finished
	queue_free()
