extends Area2D

const damage: int = 5
const speed: float = 100.0
var direction: Vector2 = Vector2.LEFT

func _process(delta):
	position += speed * direction * delta

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if "hit" in body:
		body.hit(damage)
	queue_free()
