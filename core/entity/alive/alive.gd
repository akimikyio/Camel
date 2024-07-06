extends Entity
class_name Alive

# parameters properites
#@export var max_health: int
#@export var health: int
#@export var max_defence: int
#@export var defence: int

@onready var max_health: int = 1: 
	set(value):
		max_health = value
		$HealthBar.max_value = max_health

@onready var health: int = 1: 
	set(value):
		health = min(max_health, value)
		$HealthBar.value = health
		if is_alive and health <= 0:
			death()

@export var max_defence: int: 
	set(value):
		max_defence = value

@export var defence: int: 
	set(value):
		defence = min(max_defence, value)

# physics properties
@export var jump_velocity: float
@export var speed: float
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# states variables
var is_attacking: bool = false
var is_stunned: bool = false
var is_alive: bool = true
# TODO: Make FSM (Finite-State-Machine) instead of it

#func health_change(amount: int):
	#health += amount
	#$HealthBar.value = health
	#if is_alive and health <= 0:
		#death()

#func max_health_change(amount: int):
	#max_health += amount
	#$HealthBar.max_value = health

#func defence_change(amount: int):
	#defence += amount

#func max_defence_change(amount: int):
	#max_defence += amount

func death():
	if $AnimationPlayer.has_animation("death"):
		$AnimationPlayer.play("death")
		await $AnimationPlayer.animation_finished
	queue_free()

func take_damage(amount):
	health -= amount
	if $AnimationPlayer.has_animation("take_damage"):
		$AnimationPlayer.play("take_damage")
		is_stunned = true
		await $AnimationPlayer.animation_finished
		is_stunned = false
