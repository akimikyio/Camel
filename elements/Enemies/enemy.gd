extends CharacterBody2D
class_name Enemy

@export var max_health: int
@export var health: int
var is_disabled: bool = false

func _ready():
	if has_node("HealthBar"):
		$HealthBar.value = health
	if $AnimationPlayer.has_animation("idle"):
		$AnimationPlayer.play("idle")

func hit(amount):
	health -= amount
	if has_node("HealthBar"):
		$HealthBar.value = health
	if health <= 0:
		queue_free()
	if $AnimationPlayer.has_animation("hit"):
		$AnimationPlayer.play("hit")
		is_disabled = true
		await $AnimationPlayer.animation_finished
		is_disabled = false
