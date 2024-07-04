extends CharacterBody2D
class_name Enemy

var max_health: int
@onready var health: int:
	set(value):
		print(value)
		health = max(0, value)
		if has_node("HealthBar"):
			$HealthBar.value = value
func hit(amount):
	health -= amount
	if health <= 0:
		queue_free()
